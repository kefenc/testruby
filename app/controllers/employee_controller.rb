class EmployeeController < ApplicationController
    require 'rest-client'
    require 'excon'
    require 'json'
    require 'ostruct'

    def index
    end
  
    def search
      employees = find_employee(params[:employee])
      @employee = employees
      unless employees
        flash[:alert] = 'Employee not found'
        return render action: :index
      end
      # ...
    end
  
    # app/controllers/travel_controller.rb
    private
  
   

    # def request_api(url)
    #   response = RestClient.get(url)
    #   print("response: ", response)
    #   object = JSON.parse(response, object_class: OpenStruct)
    #   print(object._embedded.employeeList)
    #   JSON.parse(object.toString())
    # end

    def request_api(url)
      begin
        response = RestClient.get(url)
        print("response: ", response)
        JSON.parse(response)
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
  