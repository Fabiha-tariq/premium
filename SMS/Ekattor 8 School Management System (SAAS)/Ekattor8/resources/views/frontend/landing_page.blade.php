@extends('frontend.index')
@section('content')

<!--  Header Area Start -->
<header class="header-area">
    <div class="container-xl">
        <div class="row align-items-center">
            <div class="col-lg-2 col-md-6 col-sm-6 col-5">
                <!-- Logo  -->
                <div class="logo">
                    <a href="#"><img src="{{ asset('public/frontend/assets/image/logo.png') }}" alt="logo"></a> 
                </div>
            </div>
            <div class="col-lg-7 col-md-6 menu-items">
                <!-- Menu -->
                <nav class="header-menu">
                    <ul class="primary-menu d-flex justify-content-center">
                        <li class="nav-item"><a class="nav-link" href="#">{{ get_phrase('Home') }}</a></li>
                        <li class="nav-item"><a class="nav-link" href="#feature">{{ get_phrase('Feature') }}</a></li>
                        <li class="nav-item"><a class="nav-link" href="#price">{{ get_phrase('Price') }}</a></li>
                        <li class="nav-item"><a class="nav-link" href="#faq">{{ get_phrase('Faq') }}</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">{{ get_phrase('Contact') }}</a></li>
                    </ul>
                </nav>
                <a class="small-device-show" href="#"><img src="{{ asset('public/frontend/assets/image/logo.png') }}" alt="logo"></a>
                <span class="crose-icon"><i class="fa-solid fa-xmark"></i></span>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-7">
                <!-- Button Area -->
                <div class="header-btn">
                    @php
                    if(isset(auth()->user()->id) && auth()->user()->id != "") {
                        if (auth()->user()->role_id =='1') {
                            $panel = 'Superadmin';
                            $dashboard = route('superadmin.dashboard');
                            $user_profile = route('superadmin.profile');
                        } elseif(auth()->user()->role_id =='2'){
                            $panel = 'Administrator';
                            $dashboard = route('admin.dashboard');
                            $user_profile = route('admin.profile');
                        } elseif(auth()->user()->role_id =='3'){
                            $panel = 'Teacher';
                            $dashboard = route('teacher.dashboard');
                            $user_profile = route('teacher.profile');
                        } elseif(auth()->user()->role_id =='4'){
                            $panel = 'Accountant';
                            $dashboard = route('accountant.dashboard');
                            $user_profile = route('accountant.profile');
                        } elseif(auth()->user()->role_id =='5'){
                            $panel = 'Librarian';
                            $dashboard = route('librarian.dashboard');
                            $user_profile = route('librarian.profile');
                        } elseif(auth()->user()->role_id =='6'){
                            $panel = 'Parent';
                            $dashboard = route('parent.dashboard');
                            $user_profile = route('parent.profile');
                        } elseif(auth()->user()->role_id =='7'){
                            $panel = 'Student';
                            $dashboard = route('student.dashboard');
                            $user_profile = route('student.profile');
                        }
                    }
                    @endphp
                    @if(isset(auth()->user()->id) && auth()->user()->id != "")
                        <a class="login-btn" href="{{ $dashboard }}">{{ get_phrase($panel) }}</a>
                        <!-- User Profile Start -->
                        <div class="user-profile">
                            <button class="us-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                             <img src="{{ get_user_image(auth()->user()->id) }}" alt="user-img">
                           </button>
                           <ul class="dropdown-menu dropmenu-end">
                               <li><a class="dropdown-item" href="{{ $user_profile }}"><i class="fa-solid fa-user"></i> {{ get_phrase('Profile') }}</a></li>
                               <li><a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();"><i class="fa-solid fa-arrow-right-from-bracket"></i>  {{ get_phrase('Log out') }}</a>
                                   <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                        @csrf
                                    </form>
                                </li>
                           </ul>
                         </div>
                        <!-- User Profile End -->
                    @else
                        <a class="login-btn" href="{{ route('login') }}">{{ get_phrase('Login') }}</a>
                        <a class="signUp-btn" href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop">{{ get_phrase('Register') }}</a>
                    @endif
                    <span class="hambargar-bar"><i class="fa-solid fa-bars"></i></span>
                </div>
            </div>
        </div>
    </div>
</header> 
<!--  Header Area End   -->
 <!-- Register Form Modal Start -->
    <div class="register-form-modal">
        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5 text-center" id="staticBackdropLabel">{{ get_phrase('School Register Form') }}</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="{{ route('school.create') }}">
                    	@csrf
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="reg-modal-form">
                                    <h4>{{ get_phrase('SCHOOL INFO') }}</h4>
                                    <div class="reg-form-group">
                                        <div class="single-form">
                                            <label for="school_name">{{ get_phrase('School Name') }}</label>
                                            <input id="school_name" name="school_name" type="text" class="form-control" required>
                                        </div>
                                        <div class="single-form">
                                            <label for="school_address">{{ get_phrase('School Address') }}</label>
                                            <input id="school_address" name="school_address" type="text" class="form-control" required>
                                        </div>
                                        <div class="single-form">
                                            <label for="school_email">{{ get_phrase('School Email') }}</label>
                                            <input id="school_email" name="school_email" type="email" class="form-control" required>
                                        </div>
                                        <div class="single-form">
                                            <label for="school_phone">{{ get_phrase('School Phone') }}</label>
                                            <input id="school_phone" name="school_phone" type="tel" class="form-control" required>
                                        </div>
                                        <div class="single-form">
                                            <label for="school_info">{{ get_phrase('School info') }}</label>
                                           <textarea name="school_info" id="school_info" class="form-control" required></textarea>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                            <div class="col-lg-6">
                                <div class="reg-modal-form">
                                    <h4>{{ get_phrase('ADMIN INFO') }}</h4>
                                    <div class="reg-form-group">
                                        <div class="single-form">
                                            <label for="admin_name">{{ get_phrase('Admin Name') }}</label>
                                            <input id="admin_name" name="admin_name" type="text" class="form-control" required>
                                        </div>
                                        <div class="single-form">
                                            <label for="gender">{{ get_phrase('Gender') }}</label>
                                            <select class="form-select" id="gender" name="gender" required>
                                                <option value="">{{ get_phrase('Select a gender') }}</option>
                                                <option value="Male">{{ get_phrase('Male') }}</option>
                                                <option value="Female">{{ get_phrase('Female') }}</option>
                                              </select>
                                        </div>
                                        <div class="single-form">
                                            <label for="blood_group">{{ get_phrase('Blood group') }}</label>
                                            <select class="form-select"  id="blood_group" name="blood_group" required>
                                                <option value="">{{ get_phrase('Select a blood group') }}</option>
                                                <option value="a+">{{ get_phrase('A+') }}</option>
							                    <option value="a-">{{ get_phrase('A-') }}</option>
							                    <option value="b+">{{ get_phrase('B+') }}</option>
							                    <option value="b-">{{ get_phrase('B-') }}</option>
							                    <option value="ab+">{{ get_phrase('AB+') }}</option>
							                    <option value="ab-">{{ get_phrase('AB-') }}</option>
							                    <option value="o+">{{ get_phrase('O+') }}</option>
							                    <option value="o-">{{ get_phrase('O-') }}</option>
                                              </select>
                                        </div>
                                        <div class="single-form">
                                            <label for="admin_address">{{ get_phrase('Admin Address') }}</label>
                                            <input id="admin_address" name="admin_address" type="text" class="form-control" required>
                                        </div>
                                        <div class="single-form">
                                            <label for="admin_phone">{{ get_phrase('Admin Phone Number') }}</label>
                                            <input id="admin_phone" name="admin_phone" type="tel" class="form-control" required>
                                        </div>
                                        <div class="single-form">
                                            <label for="photo">{{ get_phrase('Photo') }}</label>
                                            <input class="form-control" type="file" accept="image/*" id="photo" name="photo" >
                                        </div>
                                        <div class="single-form">
                                            <label for="admin_email">{{ get_phrase('Admin Email') }}</label>
                                            <input id="admin_email" name="admin_email" type="email" class="form-control" required>
                                        </div>
                                        <div class="single-form">
                                            <label for="admin_password">{{ get_phrase('Admin Password') }}</label>
                                            <input id="admin_password" name="admin_password" type="password" class="form-control" required>
                                        </div>
                                    </div>
                                </div> 
                                <button class="m-submit-btn" type="submit">{{ get_phrase('Submit') }}</button>
                            </div>
                        </div>
                    </form>
                </div>
             </div>
            </div>
        </div>
     </div>
 <!-- Register Form Modal End -->
<!--  Bannar Area Start  -->
<section class="bannar-area">
    <!-- Safe -->
    <span class="safe-top"><img src="{{ asset('public/frontend/assets/image/safe-2.png') }}" alt="img"></span>
    <span class="safe-left"><img src="{{ asset('public/frontend/assets/image/safe-1.png') }}" alt="img"></span>
    <div class="container-xl">
        <div class="row">
            <div class="col-lg-6">
                <!-- Bannar Content -->
                <div class="bannar-content">
                    <h4>{{ get_settings('system_title') }}</h4>
                    <h2>{{ get_settings('banner_title') }}</h2>
                    <p>{{ get_settings('banner_subtitle') }}</p>
                    <div class="ekatoor-user">
                        <div class="single-user">
                            <h3>{{ count($schools) }}</h3>
                            <span>{{ get_phrase('Schools') }}</span>
                        </div>
                        <div class="single-user">
                            <h3>{{ count($users) }}</h3>
                            <span>{{ get_phrase('User Account') }}</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="bananr-right-img">
                    <img src="{{ asset('public/frontend/assets/image/bannar-image.png') }}" alt="image">
                </div>
            </div>
        </div>
    </div>
</section>
<!--  Bannar Area End   -->
<!--  Service Area Start  -->
<section class="service-area section-padding" id="feature">
    <div class="container">
        <!-- Title  -->
        <div class="title-area">
            <h1>{{ get_phrase('Our Features') }}</h1>
            <h3>{{ get_phrase('Features') }}</h3>
            <p>Make your application more advanced with Ekattor 8</p>
        </div>
        <div class="row mt-5 pt-3">
            <div class="col-lg-3 col-md-4 col-sm-6 col-12  mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-1.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Students Admission') }}</h3>
                        <p>{{ get_phrase('Your schools can add their students in two different ways') }}.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12  mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-2.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Daily Attendance') }}</h3>
                        <p>{{ get_phrase('Take your students attendance in a smart way') }}</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-3.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Class List') }}</h3>
                        <p>{{ get_phrase('Manage your schools class list whenever you want') }}.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-4.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Subjects') }}</h3>
                        <p>{{ get_phrase('Add different subjects for different classes') }}.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12  mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-5.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Event Calender') }}</h3>
                        <p>{{ get_phrase('The school admin can manage their schools events separately') }}.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12  mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-6.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Routine') }}</h3>
                        <p>{{ get_phrase('Manage your schools class routine easily') }}.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12  mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-7.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Student Information') }}</h3>
                        <p>{{ get_phrase('Add your students information within a few minute') }}</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12  mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-8.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Syllabus') }}</h3>
                        <p>{{ get_phrase('Manage syllabuses based on the classes') }}.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12  mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-9.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Fees Management') }}</h3>
                        <p>{{ get_phrase('Pay academic fees in a smart way with Ekattor 8') }}</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12  mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-10.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('ID Card Generator') }}</h3>
                        <p>{{ get_phrase('Generate your students ID card whenever you want') }}.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12  mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-11.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Online Payment Gateway') }}</h3>
                        <p>{{ get_phrase('Pay your subscription and academic fees') }}.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12  mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-11.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Invoice Generator') }}</h3>
                        <p>{{ get_phrase('Generate invoices to make the payments more reliable') }}.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row hide-service">
            <div class="col-lg-3 col-md-4 col-sm-6 col-12  mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-11.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Offline Payment') }}</h3>
                        <p>{{ get_phrase('Complete payment with local money') }}.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12  mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-4.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Book List') }}</h3>
                        <p>{{ get_phrase('Manage your schools library within a few clicks') }}.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-5.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Noticeboard') }}</h3>
                        <p>{{ get_phrase('Manage your schools notices smartly') }}</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-1.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Exam') }}</h3>
                        <p>{{ get_phrase('Create and manage your schools exams and categories') }}</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12  mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-8.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Marks Management') }}</h3>
                        <p>{{ get_phrase('Manage your students exam marks') }}.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12  mb-60">
                <div class="service-items">
                    <div class="service-icon">
                        <img src="{{ asset('public/frontend/assets/image/feature/icon-6.png') }}" alt="icon-img">
                    </div>
                    <div class="service-text">
                        <h3>{{ get_phrase('Grade') }}Grade</h3>
                        <p>{{ get_phrase('Add and manage grades in the examination') }}.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="see-all-btn">
            <a class="see-btn">{{ get_phrase('See all') }} <i class="fa-solid fa-right-long"></i></a>
        </div>
    </div>
</section>
<!--  Feature Area End   -->
<!--  Pricing Area Start   -->
<section class="pricing-area section-padding" id="price">
    <div class="container-xl">
        <!-- Title  -->
        <div class="title-area">
            <h1>{{ get_phrase('Price') }}</h1>
            <h3>{{ get_phrase('Price') }}</h3>
            <p>{{ get_settings('price_subtitle') }}</p>
        </div>
        <div class="row">
        	@foreach($packages as $package)
	        	@if($package->interval == 'Monthly')
	        		@php $interval = 'mon'; @endphp
	        	@elseif($package->interval == 'Yearly')
	        		@php $interval = 'year'; @endphp
	        	@else
	        		@php $interval = 'day'; @endphp
	        	@endif
            <div class="col-lg-3 col-md-6 col-sm-6 mb-3">
                <div class="pricing-table">
                    <span class="trail-price">{{ $package->name }}</span>
                    <h4>{{ currency($package->price) }}<span class="small-text">/{{ $interval }}</span></h4>
                    <ul class="pricing-item">
                        <li class="color-ff">{{ $package->description }}</li>
                    </ul>
                    @if(Auth::check() && auth()->user()->role_id == 1)
                        <a href="javascript:;" class="subscribe-btn" onclick="subscription_warning('{{ auth()->user()->role_id }}')">{{ get_phrase('Subscribe') }}</a>
                    @elseif(Auth::check() && auth()->user()->role_id == 2)
                        @php $status = subscription_check(auth()->user()->school_id) @endphp
                        @if($status != 1)
                            <a href="{{ route('admin.subscription.payment', ['package_id'=> $package->id]) }}" class="subscribe-btn">{{ get_phrase('Subscribe') }}</a>
                        @else
                            <a href="javascript:;" class="subscribe-btn" onclick="subscription_warning('{{ auth()->user()->role_id }}')">{{ get_phrase('Subscribe') }}</a>
                        @endif
                    @else
                        <a href="javascript:;" class="subscribe-btn" onclick="subscription_warning()">{{ get_phrase('Subscribe') }}</a>
                    @endif
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
<!--  Pricing Area End   -->
<!--  Faq  Area Start   -->
<section class="faq-area" id="faq">
    <div class="container-xl">
         <!-- Title  -->
         <div class="title-area">
            <h1>{{ get_phrase('Have Any Question') }}</h1>
            <h3>{{ get_phrase('Faq') }}</h3>
            <p>{{ get_settings('faq_subtitle') }}</p>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="accordion-area">
                    <div class="accordion" id="accordionExample">
                        @foreach($faqs as $faq)
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="heading{{ $loop->index + 1 }}">
                            <button class="accordion-button collapsed round-bg" type="button" data-bs-toggle="collapse" data-bs-target="#collapse{{ $loop->index + 1 }}" aria-expanded="false" aria-controls="collapse{{ $loop->index + 1 }}">{{ $faq->title }}</button>
                          </h2>
                          <div id="collapse{{ $loop->index + 1 }}" class="accordion-collapse collapse" aria-labelledby="heading{{ $loop->index + 1 }}" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p>{{ $faq->description }}</p>
                            </div>
                          </div>
                        </div>
                        @endforeach
                     </div>
                 </div>
            </div>
        </div>
    </div>
</section>
<!--  faq Area End   -->
<!--  Cntact  Area Start  -->
<section class="contact-us-area" id="contact">
    <div class="container-xl">
        <div class="row">
            <div class="col-lg-12">
                <div class="lan-contact">
                    <div class="contact-left text-center">
                        <h3>{{ get_phrase('Contact us with any questions') }}</h3>
                        <a class="contact-us-btn" href="mailto:{{ get_settings('contact_email') }}"><i class="fa-solid fa-envelope"></i> {{ get_phrase('Contact Us') }}</a>
                    </div>
                    <div class="contact-right">
                        <div class="envolepe-messeage">
                            <img src="{{ asset('public/frontend/assets/image/envelope.png') }}" alt="image">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--  Contact Area End   -->
<!-- Footer Area Start -->
<footer class="footer-area">
   <!-- footer Top Area -->
    <div class="footer-top">
         <div class="container-xl">
             <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-12 mb-5">
                    <div class="footer-items">
                        <div class="footer-logo">
                            <a href="#"><img src="{{ asset('public/assets/uploads/logo/'.get_settings('light_logo')) }}" alt="image"></a>
                        </div>
                        <p>{{ get_settings('frontend_footer_text') }}</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 mb-5">
                    <div class="contacts footer-items">
                        <h4>Contact</h4>
                        <ul class="ad-contacts">
                            <li><a href="tel:{{ get_settings('phone') }}"><i class="fa-solid fa-phone"></i>{{ get_settings('phone') }}</a></li>
                            <li><a href="mailto:{{ get_settings('contact_email') }}"><i class="fa-solid fa-envelope"></i>{{ get_settings('contact_email') }}</a></li>
                            <li><span><i class="fa-solid fa-location-dot"></i></span><p>{{ get_settings('address') }}</p></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 mb-5">
                    <div class="addons footer-items">
                        <h4>{{ get_phrase('Social Link') }}</h4>
                        <ul class="footer-social">
                            <li><a href="{{ get_settings('facebook_link') }}" title="Facebook" target="_blank"><i class="fa-brands fa-facebook-f"></i></a></li>
                            <li><a href="{{ get_settings('twitter_link') }}" title="Twitter" target="_blank"><i class="fa-brands fa-twitter"></i></a></li>
                            <li><a href="{{ get_settings('linkedin_link') }}" title="Linkedin" target="_blank"><i class="fa-brands fa-linkedin-in"></i></a></li>
                            <li><a href="{{ get_settings('instagram_link') }}" title="Instagram" target="_blank"><i class="fa-brands fa-instagram"></i></a></li>
                        </ul>
                    </div>
                </div>
          </div>
     </div>
    <div class="footer-bottom">
         <div class="copyright-text">
           <p>© {{ get_settings('copyright_text') }}</p>
        </div>
    </div>
</footer>
<!-- Footer Area End -->

<style>
    #toast-container > .toast-warning {
        font-size: 15px;
    }
</style>

<script type="text/javascript">

    "use strict";

    function subscription_warning(roleId) {
        if(roleId == 1){
            toastr.warning("You can't subscribe as superadmin");
        } else if(roleId == 2){
            toastr.warning("Your school is already subscribed to a package.");
        } else {
            toastr.warning("You are not authorized! Please login as school admin.");
        }
    }

</script>

@endsection