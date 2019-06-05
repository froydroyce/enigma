module GeneratorModule
  def random_numbers
    rand(0..99999).to_s.rjust(5, "0")
  end

  def date_ddmmyy
    Date.today.strftime("%d%m%y")
  end
end
