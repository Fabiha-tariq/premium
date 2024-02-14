<?php

namespace App\Http\Controllers;

use App\Models\Package;
use App\Models\User;
use App\Models\Session;
use App\Models\School;
use App\Models\Faq;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class HomeController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        if(get_settings('frontend_view') == '1') {
            $packages = Package::all();
            $faqs = Faq::all();
            $users = User::all();
            $schools = School::all();
            return view('frontend.landing_page', ['packages' => $packages, 'faqs' => $faqs, 'users' => $users,'schools' => $schools]);
        } else {
            return redirect(route('login'));
        }
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function superadminHome()
    {
        return view('superadminHome');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function adminDashboard()
    {
        return view('admin.dashboard');
    }


    public function schoolCreate(Request $request)
    {
        $data = $request->all();

        $school = School::create([
            'title' => $data['school_name'],
            'email' => $data['school_email'],
            'phone' => $data['school_phone'],
            'address' => $data['school_address'],
            'school_info' => $data['school_info'],
            'status' => '2',
        ]);

        if (isset($school->id) && $school->id != "") {

            $data['status'] = '1';
            $data['session_title'] = date("Y");
            $data['school_id'] = $school->id;

            $session = Session::create($data);

            School::where('id', $school->id)->update([
                'running_session' => $session->id,
            ]);
            
            if (!empty($data['photo'])) {

                $imageName = time() . '.' . $data['photo']->extension();

                $data['photo']->move(public_path('assets/uploads/user-images/'), $imageName);

                $photo  = $imageName;
            } else {
                $photo = '';
            }
            $info = array(
                'gender' => $data['gender'],
                'blood_group' => $data['blood_group'],
                'birthday' => isset($data['birthday'])? strtotime($data['birthday']):"",
                'phone' => $data['admin_phone'],
                'address' => $data['admin_address'],
                'photo' => $photo
            );
            $data['user_information'] = json_encode($info);
            User::create([
                'name' => $data['admin_name'],
                'email' => $data['admin_email'],
                'password' => Hash::make($data['admin_password']),
                'role_id' => '2',
                'school_id' => $school->id,
                'user_information' => $data['user_information'],
            ]);
        }


        return redirect()->route('login')->with('message', 'School Created Successfully');
    }
}
