class ProfilesController < ApplicationController

    def index
      @profiles = Profile.all
    end

    def show
      @profile = Profile.find(params[:id])
    end

    def new
      @profile = Profile.new
    end

    def create
      @profile = Profile.new(profile_params)

      if @profile.save
        redirect_to @profile, notice: 'Perfil creado exitosamente.'
      else
        render :new
      end
    end

    def edit
      @profile = Profile.find(params[:id])
    end

    def update
      @profile = Profile.find(params[:id])

      if @profile.update(profile_params)
        redirect_to @profile, notice: 'Perfil actualizado exitosamente.'
      else
        render :edit
      end
    end

    def destroy
      @profile = Profile.find(params[:id])
      @profile.destroy

      redirect_to profiles_url, notice: 'Perfil eliminado exitosamente.'
    end

    def libro

    end

    def desarolladora
    end

    private

    def profile_params
      params.require(:profile).permit(:nombre, :profesion, :resumen, :experiencia, :educacion, :habilidades, :idiomas, :proyectos, :contacto)
    end
end
