class TasksController < ApplicationController

    def index
        @task = Task.new #エラーメッサージ取得用
        @tasks = Task.all.order(created_at: 'desc')
    end


    def create
        require 'date'

        @task = Task.new(status:'未完了',deadline: Date.today, item:params[:task][:item])

        if @task.save
            redirect_to tasks_path
        else 

            @tasks = Task.all.order(created_at: 'desc') #再読み込み時に利用
            render 'index'
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])

        if @task.update(post_params)
            redirect_to tasks_path
        else
            render 'edit'
        end

    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        
        redirect_to tasks_path
    end

    # strongパラメータ　受け取ったハッシュをそのまま流す場合に使う
    private
        def post_params
            params.require(:task).permit(:status, :deadline, :item)
        end

end
