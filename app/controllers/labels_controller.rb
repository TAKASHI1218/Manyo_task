class LabelsController < ApplicationController
  before_action :set_label, only:[:show, :edit, :update, :destroy]

  def index
    @labels = Label.all
  end

  def new
    @label=Label.new
  end

  def create
    @label = Label.new(label_params)
    if params[:back]
      render :new
    elsif @label.save
      redirect_to labels_path, notice:"作成しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @label.update(label_params)
      redirect_to labels_path, notice: "更新されました。"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @label.destroy
      redirect_to labels_path, notice: "削除しました。"
    elsif Label.where(name: 'ラベル1')
      redirect_to labels_path, notice: "できません。"
    elsif Label.where(name: 'ラベル2')
      redirect_to labels_path, notice: "できません。"
    elsif Label.where(name: 'ラベル3')
      redirect_to labels_path, notice: "できません。"
    elsif Label.where(name: 'ラベル4')
      redirect_to labels_path, notice: "できません。"
    elsif Label.where(name: 'ラベル5')
      redirect_to labels_path, notice: "できません。"
    end
  end

  private

  def label_params
    params.require(:label).permit(:label)
  end

  def set_label
    @label = Label.find(params[:id])
  end
end
