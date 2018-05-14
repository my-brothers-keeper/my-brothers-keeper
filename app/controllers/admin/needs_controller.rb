class Admin::NeedsController < Admin::BaseController
  def edit
    @need = Need.find(params[:id])
  end

  def update
    @need = Need.find(params[:id])

    if @need.update(need_params)
      redirect_to [:admin, @need.organization]
    else
      render :new
    end
  end

  def enable
    @need = Need.find(params[:need_id])

    @need.update!(enabled: true)

    render 'replace_button'
  end

  def disable
    @need = Need.find(params[:need_id])

    @need.update!(enabled: false)

    render 'replace_button'
  end

  private

  def need_params
    params.require(:need).permit(:comment)
  end
end
