class Validacao
    def exemplo
        if body['ex'][0].has_key?('ex') == true
        else
            raise "erro"
        end
      end
end