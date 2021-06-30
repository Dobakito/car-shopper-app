class TestDrivesController < ApplicationController
  before_action :set_test_drife, only: %i[ show edit update destroy ]

  # GET /test_drives or /test_drives.json
  def index
    @test_drives = TestDrive.all
  end

  # GET /test_drives/1 or /test_drives/1.json
  def show
  end

  # GET /test_drives/new
  def new
    @test_drife = TestDrive.new
  end

  # GET /test_drives/1/edit
  def edit
  end

  # POST /test_drives or /test_drives.json
  def create
    @test_drife = TestDrive.new(test_drife_params)

    respond_to do |format|
      if @test_drife.save
        format.html { redirect_to @test_drife, notice: "Test drive was successfully created." }
        format.json { render :show, status: :created, location: @test_drife }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test_drife.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_drives/1 or /test_drives/1.json
  def update
    respond_to do |format|
      if @test_drife.update(test_drife_params)
        format.html { redirect_to @test_drife, notice: "Test drive was successfully updated." }
        format.json { render :show, status: :ok, location: @test_drife }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test_drife.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_drives/1 or /test_drives/1.json
  def destroy
    @test_drife.destroy
    respond_to do |format|
      format.html { redirect_to test_drives_url, notice: "Test drive was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_drife
      @test_drife = TestDrive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_drife_params
      params.fetch(:test_drife, {})
    end
end
