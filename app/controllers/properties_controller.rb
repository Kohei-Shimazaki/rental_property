class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  def index
    @properties = Property.all
  end
  def new
    @property = Property.new
  end
  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice: "新しい物件情報を登録しました！"
    else
      render :new
    end
  end
  def show
  end
  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: "物件情報を更新しました！"
    else
      render :edit
    end
  end
  def destroy
    @property.destroy
    redirect_to properties_path, notice: "物件情報を削除しました！"
  end
  private
  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :note)
  end
  def set_property
    @property = Property.find_by(params[:id])
  end
end
