<table id="basic-datatable" class="table eTable">
    <thead>
        <tr>
            <th>#</th>
            <th>{{ get_phrase('Exam') }}</th>
            <th>{{ get_phrase('Starting Time') }}</th>
            <th>{{ get_phrase('Ending Time') }}</th>
            <th>{{ get_phrase('Total Marks') }}</th>
            <th class="text-center">{{ get_phrase('Action') }}</th>
        </tr>
    </thead>
    <tbody>
        @foreach($exams as $exam)
            <tr>
                <td>{{ $loop->index + 1 }}</td>
                <td>{{ $exam->name }}</td>
                <td>{{ date('d M Y - h:i A', $exam->starting_time) }}</td>
                <td>{{ date('d M Y - h:i A', $exam->ending_time) }}</td>
                <td>{{ $exam->total_marks }}</td>
                <td class="text-start">
                    <div class="adminTable-action">
                        <button
                          type="button"
                          class="eBtn eBtn-black dropdown-toggle table-action-btn-2"
                          data-bs-toggle="dropdown"
                          aria-expanded="false"
                        >
                          {{ get_phrase('Actions') }}
                        </button>
                        <ul
                          class="dropdown-menu dropdown-menu-end eDropdown-menu-2 eDropdown-table-action"
                        >
                          <li>
                            <a class="dropdown-item" href="javascript:;" onclick="rightModal('{{ route('admin.edit.offline_exam', ['id' => $exam->id]) }}', '{{ get_phrase('Edit Exam') }}')">{{ get_phrase('Edit') }}</a>
                          </li>
                          <li>
                            <a class="dropdown-item" href="javascript:;" onclick="confirmModal('{{ route('admin.offline_exam.delete', ['id' => $exam->id]) }}', 'undefined');">{{ get_phrase('Delete') }}</a>
                          </li>
                        </ul>
                    </div>
                </td>
            </tr>
        @endforeach
    </tbody>
</table>