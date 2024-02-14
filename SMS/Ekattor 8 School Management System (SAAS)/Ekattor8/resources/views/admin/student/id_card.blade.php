<!--title-->
<div class="row">
  <div class="col-12">
    <div class="card">
      <div class="card-body">

        <!-- ID CARD STARTS HERE -->
        <div class="id-card-hook"></div>
        <div class="id-card-holder div-sc-one" id="printableArea">
          <div class="id-card div-sc-two">
            <div class="dv-sc-four">
              <img class="im-sc-one" src="{{ asset('public/assets') }}/images/id_logo.png">
            </div>
            <div class="school_title div-sc-three">{{ DB::table('schools')->where('id', auth()->user()->school_id)->value('title') }}</div>
            <div class="photo div-sc-four">
              <img src="{{ $student_details->photo }}" class="rounded-circle div-sc-five">
            </div>
            <h2 class="head-sc-one">{{ $student_details->name }}</h2>
            <div class="dv-sc-four">
              <table class="student_id_card table-sc-one">
                <tbody>
                  <tr>
                    <td class="td-sc-one">{{ get_phrase('Code') }} : </td>
                    <td class="td-sc-two">{{ null_checker($student_details->code) }}</td>
                  </tr>
                  <tr>
                    <td class="td-sc-three">{{ get_phrase('Class') }} : </td>
                    <td class="td-sc-two">{{ null_checker($student_details->class_name) }}</td>
                  </tr>
                  <tr>
                    <td class="td-sc-three">{{ get_phrase('Section') }} : </td>
                    <td class="td-sc-two">{{ null_checker($student_details->section_name) }}</td>
                  </tr>
                  <tr>
                    <td class="td-sc-three">{{ get_phrase('Parent') }} : </td>
                    <td class="td-sc-two">{{ null_checker($student_details->parent_name) }}</td>
                  </tr>
                  <tr>
                    <td class="td-sc-three">{{ get_phrase('Blood') }} : </td>
                    <td class="td-sc-two">{{ null_checker(strtoupper($student_details->blood_group)) }}</td>
                  </tr>
                  <tr>
                    <td class="td-sc-three">{{ get_phrase('Contact') }} : </td>
                    <td>{{ null_checker($student_details->phone) }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <hr>
            
            </div>
          </div>
          <!-- ID CARD ENDS HERE -->

          <div class="d-print-none mt-4">
            <div class="text-center">
              <input type="button" class="eBtn eBtn btn-primary" onclick="printableDiv('printableArea')" value="{{ get_phrase('Print') }}" />
            </div>
          </div>
          <!-- end buttons -->

        </div> <!-- end card-body-->
      </div> <!-- end card -->
    </div> <!-- end col-->
  </div>

<script type="text/javascript">
  
  "use strict";

  function printableDiv(printableAreaDivId) {
    var printContents = document.getElementById(printableAreaDivId).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
  }
</script>
