<?php
/**
 * Its pos order model
 *
 * @since: 21/09/2021
 * @author: Sarwar Hasan
 * @version 1.0.0
 * @package VitePos\Libs
 */

namespace VitePos\Libs;

use VitePos\Api\V1\Pos_User_Api;
use Vitepos\Models\Database\Mapbd_Pos_Counter;
use Vitepos\Models\Database\Mapbd_Pos_Warehouse;
use VitePos\Modules\POS_Settings;

/**
 * Class Pos Order
 *
 * @package VitePos\Libs
 */
class POS_Order {

	/**
	 * Its property order_id
	 *
	 * @var int
	 */
	public $order_id;
	/**
	 * Its property cart_id
	 *
	 * @var int
	 */
	public $cart_id;
	/**
	 * Its property cart_unique_id
	 *
	 * @var int
	 */
	public $cart_unique_id;
	/**
	 * Its property items
	 *
	 * @var array
	 */
	public $items = array();

	/**
	 * Its property fees
	 *
	 * @var array
	 */
	public $fees = array();
	/**
	 * Its property discounts
	 *
	 * @var array
	 */
	public $discounts = array();

	/**
	 * Its property note
	 *
	 * @var string
	 */
	public $note = '';
	/**
	 * Its property payment_note
	 *
	 * @var string
	 */
	public $payment_note = '';
	/**
	 * Its property payment_method
	 *
	 * @var string
	 */
	public $payment_method = '';
	/**
	 * Its property customer
	 *
	 * @var string
	 */
	public $customer;
	/**
	 * Its property sub_total
	 *
	 * @var int
	 */
	public $sub_total;
	/**
	 * Its property tax_total
	 *
	 * @var int
	 */
	public $tax_total;
	/**
	 * Its property grand_total
	 *
	 * @var int
	 */
	public $grand_total;
	/**
	 * Its property given_amount
	 *
	 * @var int
	 */
	public $given_amount;
	/**
	 * Its property returned_amount
	 *
	 * @var int
	 */
	public $returned_amount;
	/**
	 * Its property currency
	 *
	 * @var string
	 */
	public $currency = '';
	/**
	 * Its property outlet_info
	 *
	 * @var null
	 */
	public $outlet_info;
	/**
	 * Its property processed_by
	 *
	 * @var string
	 */
	public $processed_by;
	/**
	 * Its property offline_id
	 *
	 * @var string
	 */
	public $offline_id;

	/**
	 * The get order by meta is generated by appsbd
	 *
	 * @param mixed  $key Its key param.
	 * @param mixed  $value Its value param.
	 * @param string $compare Its compare param.
	 *
	 * @return \WC_Order|null
	 */
	public static function get_order_by_meta( $key, $value, $compare = '=' ) {
		$args   = array(
			'limit'        => 1,
			'meta_key'     => $key, 			'meta_value'   => $value, 			'meta_compare' => $compare, 		);
		$orders = wc_get_orders( $args );
		if ( ! empty( $orders ) && ! empty( $orders[0] ) && $orders[0] instanceof \WC_Order ) {
			return $orders[0];
		}
		return null;
	}
	/**
	 * The getFromWooOrderDetailsByID is generated by appsbd
	 *
	 * @param any $id Its integer.
	 *
	 * @return POS_Order
	 */
	public static function get_from_woo_order_details_by_id( $id ) {
		 $order = new \WC_Order( $id );
		return self::get_from_woo_order_details( $order );
	}

	/**
	 * The get from woo order details is generated by appsbd
	 *
	 * @param any $order Its string.
	 *
	 * @return POS_Order
	 */
	public static function get_from_woo_order_details( $order ) {
		global $wpdb;
		$v_order = new self();
		if ( $order instanceof \WC_Order ) {
			$v_order->order_id      = $order->get_id();
			$v_order->currency      = $order->get_currency();
			$complete_date          = $order->get_date_completed();
			$v_order->order_date    = appsbd_get_wp_datetime_with_format( $complete_date );
			$v_order->currency_code = get_woocommerce_currency_symbol( $order->get_currency() );
			foreach ( $order->get_items() as $item ) {
				if ( $item instanceof \WC_Order_Item_Product ) {
					$v_order->items[] = POS_Order_Item::get_product_item( $item, $order );
				}
			}
			foreach ( $order->get_items( 'fee' ) as $item ) {
				if ( $item instanceof \WC_Order_Item_Fee ) {
					$dis_fee_obj       = new \stdClass();
					$dis_fee_obj->type = $item->get_meta( '_vtp_cal_type' );
					$dis_fee_obj->val  = floatval( $item->get_meta( '_vtp_cal_val' ) );
					if ( $item->get_total() > 0 ) {
												$v_order->fees[] = $dis_fee_obj;
					} else {
												$v_order->discounts[] = $dis_fee_obj;
					}
				}
			}

			$customer_id = intval( $order->get_customer_id( '' ) );
			if ( ! empty( $customer_id ) ) {
				$v_order->customer = POS_Settings::get_customer_object_by_id( $customer_id );
			}
			
						$processed_by = $order->get_meta( '_vtp_processed_by' );
			if ( ! empty( $processed_by ) ) {
				$user                        = get_user_by( 'id', $processed_by );
				$v_order->processed_by       = new \stdClass();
				$v_order->processed_by->id   = $processed_by;
				$v_order->processed_by->name = ! empty( $user ) ? appsbd_get_user_title_by_user( $user ) : 'Unknown';
			}
			elseif (!metadata_exists( 'post',  $v_order->order_id , '_vtp_processed_by' ))
			{
				$v_order->processed_by       = new \stdClass();
				$v_order->processed_by->id   = null;
				$v_order->processed_by->name = 'Online';
			}
			else {
				$v_order->processed_by       = new \stdClass();
				$v_order->processed_by->id   = null;
				$v_order->processed_by->name = 'Unknown';
			}

			$v_order->note            = $order->get_meta( '_vtp_order_note' );
			$v_order->payment_note    = $order->get_meta( '_vtp_payment_note' );
			$v_order->payment_method  = $order->get_meta( '_vtp_payment_method' );
			$v_order->given_amount    = floatval( $order->get_meta( '_vtp_tendered_amount' ) );
			$v_order->returned_amount = floatval( $order->get_meta( '_vtp_change_amount' ) );
			$v_order->sub_total       = $order->get_subtotal();
			$v_order->tax_total       = floatval( $order->get_total_tax( '' ) );
			$v_order->grand_total     = floatval( $order->get_total( '' ) );
			$v_order->payment_list    = $order->get_meta( '_vtp_payment_list' );
			$outlet_id                = $order->get_meta( '_vtp_outlet_id' );
			$outlet_info              = null;
			if ( ! empty( $outlet_id ) ) {
				$outlet_info = Mapbd_Pos_Warehouse::find_by( 'id', $outlet_id );
			}
			$v_order->outlet_info = null;
			if ( ! empty( $outlet_info ) ) {
				$v_order->outlet_info = new \stdClass();
				$props                = array( 'id', 'name', 'email', 'phone', 'country', 'state', 'city', 'street', 'zip_code' );
				foreach ( $props as $prop ) {
					$v_order->outlet_info->{$prop} = ! empty( $outlet_info ) ? $outlet_info->{$prop} : '';
				}
			}
			$counter_id  = $order->get_meta( '_vtp_counter_id' );
			$counter_obj = null;
			if ( ! empty( $counter_id ) ) {
				$counter_obj = Mapbd_Pos_Counter::find_by( 'id', $counter_id );
			}
			$v_order->counter        = $counter_obj;
			$v_order->cash_drawer_id = $order->get_meta( '_vtp_cash_drawer_id' );
			$offline_id              = $order->get_meta( '_vtp_offline_id' );
			if ( ! empty( $offline_id ) ) {
				$v_order->offline_id = $offline_id;
			}
		}

		return $v_order;
	}

	/**
	 * The get from woo order is generated by appsbd
	 *
	 * @param any $order Its string.
	 * @param any $is_online Its Boolean.
	 *
	 * @return \stdClass Its string.
	 */
	public static function get_from_woo_order( $order,$is_online=false) {
		 global $wpdb;
		$v_order = new \stdClass();
		if ( $order instanceof \WC_Order ) {
			$v_order->order_id      = $order->get_id();
			$complete_date          = $order->get_date_completed();
			$v_order->order_date    = appsbd_get_wp_datetime_with_format( $complete_date );			$v_order->currency      = $order->get_currency();
			$v_order->currency_code = get_woocommerce_currency_symbol( $order->get_currency() );
			$v_order->customer_id   = intval( $order->get_customer_id( '' ) );

			$v_order->customer_first_name = '';
			$v_order->customer_last_name  = '';
			$v_order->customer_username   = '';
			if ( ! empty( $v_order->customer_id ) ) {
				$user = get_user_by( 'ID', $v_order->customer_id );
				if ( ! empty( $user ) ) {
					$v_order->customer_first_name = $user->first_name;
					$v_order->customer_last_name  = $user->last_name;
					$v_order->customer_username   = $user->user_nicename;
				}
			}

			$v_order->outlet_id = $order->get_meta( '_vtp_outlet_id' );

			$v_order->outlet_name = '';
			if ( ! empty( $v_order->outlet_id ) ) {
				$outlet_info = Mapbd_Pos_Warehouse::find_by( 'id', $v_order->outlet_id );
				if ( ! empty( $outlet_info ) ) {
					$v_order->outlet_name = $outlet_info->name;
				}
			}

			$v_order->processed_by = '';
			$processed_by          = $order->get_meta( '_vtp_processed_by' );
			if ( ! empty( $processed_by ) && !$is_online) {
				$user                  = get_user_by( 'id', $processed_by );
				$v_order->processed_by = appsbd_get_user_title_by_user( $user );
			}

			$v_order->note            = $order->get_meta( '_vtp_order_note' );
			$v_order->payment_note    = $order->get_meta( '_vtp_payment_note' );
			$v_order->payment_method  = $order->get_meta( '_vtp_payment_method' );
			$v_order->given_amount    = floatval( $order->get_meta( '_vtp_tendered_amount' ) );
			$v_order->returned_amount = floatval( $order->get_meta( '_vtp_change_amount' ) );
			$v_order->sub_total       = $order->get_subtotal();
			$v_order->tax_total       = floatval( $order->get_total_tax( '' ) );
			$v_order->grand_total     = floatval( $order->get_total( '' ) );
			$v_order->offline_id      = $order->get_meta( '_vtp_offline_id', true );
			$v_order->counter         = '';
			$v_order->counter_id      = $order->get_meta( '_vtp_counter_id' );
			if ( ! empty( $v_order->counter_id ) ) {
				$counter_obj = Mapbd_Pos_Counter::find_by( 'id', $v_order->counter_id );
				if ( ! empty( $counter_obj ) ) {
					$v_order->counter = $counter_obj->name;
				}
			}
			$v_order->cash_drawer_id = $order->get_meta( '_vtp_cash_drawer_id' );
		}
		return $v_order;
	}

	/**
	 * The set search props is generated by appsbd
	 *
	 * @param any $filters Its string.
	 * @param any $src_props Its string.
	 */
	public static function order_search_props( &$filters, $src_props ) {
		if ( ! empty( $src_props ) ) {
			foreach ( $src_props as $src_prop ) {
				$filter = array();
				if ( ! empty( $src_prop['prop'] ) && isset( $src_prop['val'] ) ) {
					if ( 'outlet_id' == $src_prop['prop'] ) {
						$src_prop['val']   = trim( $src_prop['val'] );
						$filter['key']     = '_vtp_outlet_id';
						$filter['value']   = intval( $src_prop['val'] );
						$filter['compare'] = '=';

					} elseif ( 'processed_by' == $src_prop['prop'] ) {
						$user_src_prop         = array();
						$user_src_prop['prop'] = '*';
						$user_src_prop['val']  = trim( $src_prop['val'] );
						$users                 = self::order_user( 'U', array( $user_src_prop ) );
						if ( ! empty( $users ) ) {
							$filter['key']     = '_vtp_processed_by';
							$filter['value']   = $users;
							$filter['compare'] = 'IN';
						}
					} elseif ( 'customer' == $src_prop['prop'] ) {
						$user_src_prop         = array();
						$user_src_prop['prop'] = '*';
						$user_src_prop['val']  = trim( $src_prop['val'] );
						$users                 = self::order_user( 'C', array( $user_src_prop ) );
						if ( ! empty( $users ) ) {
							$filter['key']     = '_customer_user';
							$filter['value']   = $users;
							$filter['compare'] = 'IN';
						}
					} elseif ( '*' == $src_prop['prop'] ) {
						$src_prop['val'] = trim( $src_prop['val'] );
						$user            = get_user_by( 'login', $src_prop['val'] );
						if ( $user->ID ) {
							$filter['key']     = '_vtp_processed_by';
							$filter['value']   = $user->ID;
							$filter['compare'] = '=';
						}
					} elseif ( '_vtp_offline_id' == $src_prop['prop'] ) {
						$src_prop['val']       = trim( $src_prop['val'] );
							$filter['key']     = '_vtp_offline_id';
							$filter['value']   = $src_prop['val'];
							$filter['compare'] = '=';
					}elseif ( 'order_id' == $src_prop['prop'] ) {
						$src_prop['val']       = trim( $src_prop['val'] ,"# \t\n\r\0\x0B");
						$filters['post__in'] = array(intval($src_prop['val']));
					} elseif ( 'order_date' == $src_prop['prop'] ) {
						if ( 'eq' == $src_prop['opr'] ) {
							$start_date = appsbd_gm_date( $src_prop['val'], 'Y-m-d 00:00:00' );
							$end_date   = appsbd_gm_date( $src_prop['val'], 'Y-m-d 23:59:59' );
						} elseif ( 'dr' == $src_prop['opr'] || 'bt' == $src_prop['opr'] ) {
							$prop = (object) $src_prop['val'];
							if ( ! empty( $prop->start ) ) {
								if ( empty( $prop->end ) ) {
									$prop->end = $prop->start;
								}
								$start_date = appsbd_gm_date( $prop->start, 'Y-m-d 00:00:00' );
								$end_date   = appsbd_gm_date( $prop->end, 'Y-m-d 23:59:59' );
							} else {
								continue;
							}
						} else {
							continue;
						}
						if ( ! empty( $start_date ) && ! empty( $end_date ) ) {
							$filter['key']     = '_completed_date';
							$filter['value']   = array( $start_date, $end_date );
							$filter['compare'] = 'BETWEEN';
						}
					} elseif ( 'dr' == $src_prop->opr ) {
						$prop = (object) $src_prop->val;
						if ( ! empty( $prop->start ) ) {
							if ( empty( $prop->end ) ) {
								$prop->end = $prop->start;
							}
							$start_date = gmdate(
								'Y-m-d 00:00:00',
								strtotime( $prop->start )
							);
							$end_date   = gmdate(
								'Y-m-d 23:59:59',
								strtotime( $prop->end )
							);
							if ( ! empty( $start_date ) && ! empty( $end_date ) ) {
								$filter['key']     = 'date_completed';
								$filter['value']   = array( $start_date, $end_date );
								$filter['compare'] = 'BETWEEN';
							}
						}
					}
				}
				if ( ! empty( $filter ) ) {
					if ( ! isset( $filters['vt_meta_query'] ) ) {
						$filters['vt_meta_query'] = array();
					}
					$filters['vt_meta_query'] [] = $filter;
				}
			}
		}
	}

	/**
	 * The order user is generated by appsbd
	 *
	 * @param string $user_type Its string.
	 * @param array  $src_props Its array of src_props.
	 */
	public static function order_user( $user_type, $src_props ) {
		if ( 'U' == $user_type ) {
			$args = array(
				'role__not_in' => array( 'customer', 'subscriber', 'administrator' ),
				'count_total'  => true,
			);
			if ( ! POS_Settings::is_admin_user() && ! current_user_can( 'any-outlet-user-create' ) ) {
				$outlets = get_user_meta( get_current_user_id(), 'outlet_id', true );
				if ( is_array( $outlets ) ) {
					$args['meta_query'][] = array(
						'key'     => 'outlet_id',
																		'value'   => '"(' . implode( '|', $outlets ) . ')"',
						'compare' => 'REGEXP',
					);
				}
			}
		} elseif ( 'C' == $user_type ) {
			$args = array(
				'role__in'    => array( 'customer', 'subscriber' ),
				'count_total' => true,
			);
		}
		POS_Customer::set_search_param( $src_props, $args );
		$args        = wp_parse_args( $args );
		$user_search = new \WP_User_Query( $args );
		$users       = $user_search->get_results();
		$user_ids    = array_column( $users, 'ID' );
		return $user_ids;
	}

	/**
	 * The order sort param is generated by appsbd
	 *
	 * @param any $props It's sort property.
	 * @param any $sort_param It's sort param.
	 */
	public static function order_sort_param( $props, &$sort_param ) {
		foreach ( $props as $prop ) {
			if ( ! empty( $prop['prop'] ) ) {
				$prop['prop'] = strtolower( trim( $prop['prop'] ) );
				$prop['ord']  = strtolower( trim( $prop['ord'] ) );
				if ( in_array( $prop['ord'], array( 'asc', 'desc' ) ) ) {
					$sort_param['orderby'] = $prop['prop'];
					$sort_param['order']   = $prop['ord'];
				}
			}
		}
	}
	/**
	 * The add product item is generated by appsbd
	 *
	 * @param any $item Its string.
	 * @param any $order Its string.
	 */
	public function add_product_item( $item, &$order ) {
		if ( $item instanceof \WC_Order_Item_Product ) {
			$this->items[] = POS_Order_Item::get_product_item( $item, $order );
		}
	}

}
