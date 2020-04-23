module InputHelper
  def strip_input_mask(amount)
    amount = amount.tr('R$', '').tr('.', '').tr(',', '.').strip
  end
end
