$(document).ready(function(){
  // search address after input zipcode
  $('.zipcode').blur(findAddressByZipcode);

  // apply zipcode mask
  var zipcodeFormat = {
    rawValueTrimPrefix: true,
    delimiter: '-',
    blocks: [5, 3]
  };

  $('input.zipcode-mask').each(function(index) {
    new Cleave($(this), zipcodeFormat);
  });

  // apply state mask
  var stateFormat = {
    rawValueTrimPrefix: true,
    blocks: [2]
  };

  $('input.state-mask').each(function(index) {
    new Cleave($(this), stateFormat);
  });
});

var findAddressByZipcode = function() {
  var zipcode = $(this).val();
  var url = "/addresses/find_by_zipcode/" + zipcode;
  var success = populateAddressFields;
  clearAddressFields();
  $.get(url, success, 'json');
};

var clearAddressFields = function(){
  $('#property_address_attributes_address').val('');
  $('#property_address_attributes_complement').val('');
  $('#property_address_attributes_neighborhood').val('');
  $('#property_address_attributes_state').val('');
  $('#property_address_attributes_city').val('');
};

var populateAddressFields = function(data) {
  var address = data;

  $('#property_address_attributes_address').val(address.address);
  $('#property_address_attributes_complement').val(address.complement);
  $('#property_address_attributes_neighborhood').val(address.neighborhood);
  $('#property_address_attributes_state').val(address.state);
  $('#property_address_attributes_city').val(address.city);
};
