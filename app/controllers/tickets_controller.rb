class TicketsController < ApplicationController
  before_action :authenticate

  def new
    raise ActionController::RoutingError, 'ログイン状態で TicketsController#new にアクセス'
  end

  def create
    ticket = current_user.tickets.build do |t|
      t.event_id = params[:event_id]
      t.comment = params[:ticket][:comment]
    end
    if ticket.save
      flash[:notice] = 'このイベントに参加登録しました'
      head 201
    else
      render json: { messages: ticket.erors.full_messages }, status: 422
    end
  end

  def destroy
    ticket = current_user.tickets.find_by!(event_id: params[:event_id])
    ticket.destroy!
    redirect_to event_path(params[:event_id]), notice: 'このイベントへの参加をキャンセルしました。'
  end
end
