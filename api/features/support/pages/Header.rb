class Header

  def cria_header
    header = "
    {
      'Content-Type': 'application/json',
    }
    "
    eval(header)
  end
end
