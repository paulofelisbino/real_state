// Call the dataTables jQuery plugin
$(document).ready(function () {
  $('#dataTable').DataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $('#dataTable').data('source'),
      type: 'POST'
    },
    columnDefs: [
      { orderable: false, targets: [-1] },
      { searchable: false, targets: [-1] }
    ],
    columns: [
      { data: "reference" },
      { data: "property_type" },
      { data: "price" },
      { data: "dt_actions" }
    ],
    language: {
      url: "/dataTablesI18n/pt-BR"
    }
  });
});
