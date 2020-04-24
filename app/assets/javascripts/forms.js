$(document).ready(function(){
  var inputMaskFormat = {
    prefix: "R$ ",
    numeral: true,
    rawValueTrimPrefix: true,
    numeralDecimalMark: ',',
    delimiter: '.'
  };

  $('input.currency-input-mask').each(function(index) {
    new Cleave($(this), inputMaskFormat);
  });
});
