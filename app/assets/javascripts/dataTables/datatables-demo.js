// Call the dataTables jQuery plugin
$(document).ready(function () {
  $('#dataTable').DataTable({
    columnDefs: [
      { orderable: false, targets: [-1, -2] },
      { searchable: false, targets: [-1, -2] }
    ],
    language: {
      url: "/dataTablesI18n/pt-BR"
    }
  });
});
