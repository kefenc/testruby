class EmployeeController < ApplicationController
    require 'rest-client'

    def index
    end
  
    def search
      employees = find_employee(params[:employee])
      unless employees
        flash[:alert] = 'Employee not found'
        return render action: :index
      end
      @employee = employees.first
    end
  
    # app/controllers/travel_controller.rb
    private
  
    def request_api(url)
      begin
        response = RestClient.get(url)
        render json: response
        
      rescue
         return nil
      end
  
      
    end
  
    def find_employee(id)
      request_api(
        "http://localhost:8080/employees/#{URI.encode(id)}"
      )
    end
  
  end
  