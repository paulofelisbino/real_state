$(document).ready(function(){
  // apply money mask
  var inputMaskFormat = {
    prefix: "R$ ",
    numeral: true,
    rawValueTrimPrefix: true,
    numeralDecimalMark: ',',
    delimiter: '.'
  };

  $('input.currency-mask').each(function(index) {
    new Cleave($(this), inputMaskFormat);
  });
});
