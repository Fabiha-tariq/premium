<!DOCTYPE html>
<html lang="en">

<head>

  <title>{{ get_phrase('Login').' | '.get_settings('system_title') }}</title>
  <!-- all the meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta content="" name="description" />
  <meta content="" name="author" />
  <!-- all the css files -->
  <link rel="shortcut icon" href="{{ asset('public/assets/uploads/logo/'.get_settings('favicon')) }}" />
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" type="text/css" href="{{ asset('public/assets/vendors/bootstrap-5.1.3/css/bootstrap.min.css') }}">

  <!--Custom css-->
  <link rel="stylesheet" type="text/css" href="{{ asset('public/assets/css/main.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('public/assets/css/style.css') }}">

  <link rel="stylesheet" type="text/css" href="{{ asset('public/assets/vendors/bootstrap-icons-1.8.1/bootstrap-icons.css') }}">

  <!--Toaster css-->
  <link rel="stylesheet" type="text/css" href="{{ asset('public/assets/css/toastr.min.css') }}"/>

</head>

<body>

    <div class="container-fluid h-100">
        @yield('content')
    </div>

    @include('external_plugin')

    <!--Main Jquery-->
    <script src="{{ asset('public/assets/vendors/jquery/jquery-3.6.0.min.js') }}"></script>
    <!--Bootstrap bundle with popper-->
    <script src="{{ asset('public/assets/vendors/bootstrap-5.1.3/js/bootstrap.bundle.min.js') }}"></script>

    <!--Custom Script-->
    <script src="{{ asset('public/assets/js/script.js') }}"></script>
    <script src="{{ asset('public/assets/js/custom.js') }}"></script>

    <!--Toaster Script-->
    <script src="{{ asset('public/assets/js/toastr.min.js') }}"></script>

    <script>
        
        "use strict";

        @if(Session::has('message'))
        toastr.options =
        {
            "closeButton" : true,
            "progressBar" : true
        }
                toastr.success("{{ session('message') }}");
        @endif

        @if(Session::has('error'))
        toastr.options =
        {
            "closeButton" : true,
            "progressBar" : true
        }
                toastr.error("{{ session('error') }}");
        @endif

        @if(Session::has('info'))
        toastr.options =
        {
            "closeButton" : true,
            "progressBar" : true
        }
                toastr.info("{{ session('info') }}");
        @endif

        @if(Session::has('warning'))
        toastr.options =
        {
            "closeButton" : true,
            "progressBar" : true
        }
                toastr.warning("{{ session('warning') }}");
        @endif
    </script>
</body>
</html>
