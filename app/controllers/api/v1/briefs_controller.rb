# app/controllers/api/v1/briefs_controller.rb

module Api
  module V1
    class BriefsController < ApplicationController
      def create
        brief = Brief.create!(raw_text: params[:raw_text], status: 'submitted')

        if brief.persisted?
          ProcessBriefJob.perform_later(brief.id)
          render json: brief, status: :created
        else
          render json: { errors: brief.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        brief = Brief.find(params[:id])
        render json: brief.as_json(include: [:tasks])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Brief not found' }, status: :not_found
      end

      def generate_jira
        brief = Brief.find(params[:id])
        ProcessBriefJob.perform_later(brief.id)
        render json: { message: "Brief processing and Jira generation re-triggered for brief #{brief.id}" }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Brief not found' }, status: :not_found
      end
    end
  end
end