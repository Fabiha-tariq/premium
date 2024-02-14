@extends('superadmin.navigation')
   
@section('content')
<div class="mainSection-title">
    <div class="row">
        <div class="col-12">
            <div
              class="d-flex justify-content-between align-items-center flex-wrap gr-15"
            >
                <div class="d-flex flex-column">
                    <h4>{{ get_phrase('Website Settings') }}</h4>
                    <ul class="d-flex align-items-center eBreadcrumb-2">
                        <li><a href="#">{{ get_phrase('Home') }}</a></li>
                        <li><a href="#">{{ get_phrase('Settings') }}</a></li>
                        <li><a href="#">{{ get_phrase('Website Settings') }}</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="col-12">
    <div class="eSection-wrap">
        <div class="eMain">
            <div class="row">
                <div class="col-md-11 pb-3">
                    <div class="eForm-layouts">
                        <p class="column-title">{{ get_phrase('GENERAL SETTINGS') }}</p>
                        <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="{{ route('superadmin.system.update') }}">
                            @csrf
                            <div class="fpb-7">
                                    <label for="system_title" class="eForm-label">{{ get_phrase('System Title') }}</label>
                                    <input type="text" class="form-control eForm-control" value="{{ get_settings('system_title') }}" id="system_title" name = "system_title" required>
                                </div> 
                            <div class="fpb-7">
                                <label for="banner_title" class="eForm-label">{{ get_phrase('Banner Title') }}</label>
                                
                                <input type="text" class="form-control eForm-control" value="{{ get_settings('banner_title') }}" id="banner_title" name = "banner_title" required>
                                
                            </div>
                            <div class="fpb-7">
                                <label for="banner_subtitle" class="eForm-label">{{ get_phrase('Banner Subtitle') }}</label>
                                <input type="text" class="form-control eForm-control" value="{{ get_settings('banner_subtitle') }}" id="banner_subtitle" name = "banner_subtitle" required>
                            </div>
                            <div class="fpb-7">
                                <label for="price_subtitle" class="eForm-label">{{ get_phrase('Price Subtitle') }}</label>
                                <input type="text" class="form-control eForm-control" value="{{ get_settings('price_subtitle') }}" id="price_subtitle" name = "price_subtitle" required>
                            </div>
                            <div class="fpb-7">
                                <label for="faq_subtitle" class="eForm-label">{{ get_phrase('Faq Subtitle') }}</label>
                                <input type="text" class="form-control eForm-control" value="{{ get_settings('faq_subtitle') }}" id="faq_subtitle" name = "faq_subtitle" required>
                            </div>
                            <div class="fpb-7">
                                <label for="facebook_link" class="eForm-label">{{ get_phrase('Facebook Link') }}</label>
                                <input type="text" class="form-control eForm-control" value="{{ get_settings('facebook_link') }}" id="facebook_link" name = "facebook_link" required>
                            </div>
                            <div class="fpb-7">
                                <label for="twitter_link" class="eForm-label">{{ get_phrase('Twitter Link') }}</label>
                                <input type="text" class="form-control eForm-control" value="{{ get_settings('twitter_link') }}" id="twitter_link" name = "twitter_link" required>
                            </div>
                            <div class="fpb-7">
                                <label for="linkedin_link" class="eForm-label">{{ get_phrase('Linkedin Link') }}</label>
                                <input type="text" class="form-control eForm-control" value="{{ get_settings('linkedin_link') }}" id="linkedin_link" name = "linkedin_link" required>
                            </div>
                            <div class="fpb-7">
                                <label for="instagram_link" class="eForm-label">{{ get_phrase('Instagram Link') }}</label>
                                <input type="text" class="form-control eForm-control" value="{{ get_settings('instagram_link') }}" id="instagram_link" name = "instagram_link" required>
                            </div>
                            <div class="fpb-7">
                                <label for="contact_email" class="eForm-label">{{ get_phrase('Contact Mail') }}</label>
                                <input type="email" class="form-control eForm-control" value="{{ get_settings('contact_email') }}" id="contact_email" name = "contact_email" required>
                            </div>
                            <div class="fpb-7">
                                <label for="frontend_footer_text" class="eForm-label">{{ get_phrase('Frontend Footer Text') }}</label>
                                <input type="text" class="form-control eForm-control" value="{{ get_settings('frontend_footer_text') }}" id="frontend_footer_text" name = "frontend_footer_text" required>
                            </div>
                            <div class="fpb-7">
                                <label for="copyright_text" class="eForm-label">{{ get_phrase('Copyright Text') }}</label>
                                <input type="text" class="form-control eForm-control" value="{{ get_settings('copyright_text') }}" id="copyright_text" name = "copyright_text" required>
                            </div>
                             <div class="fpb-7 pt-2">
                                <button type="submit" class="btn-form">{{ get_phrase('Submit') }}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection