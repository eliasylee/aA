class Api::BenchesController < ApplicationController
  def index
    @benches = params[:bounds] ? Bench.in_bounds(params[:bounds]) : Bench.all

    render json: @benches
  end

  def create
    @bench = Bench.create!(bench_params)

    render json: @bench
  end

  private

  def bench_params
    params.require(:bench).permit(:description, :seats, :lat, :lng)
  end
end
