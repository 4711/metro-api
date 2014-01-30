# DEPENDENCIES

require 'rubygems'
require 'json'
require 'virtus'
require 'sinatra'
require 'gtfs'
require 'grape'
require 'csv'

GTFS.path = './data'

# CONSTANTS

DEFAULT_LIMIT = 20.freeze

# RESOURCES

require File.join(File.dirname(__FILE__), 'resource')

class API < Grape::API

  version 'v0'

  format :json

  resource :agencies do
    params do
      optional :page, type: Fixnum, default: 1
    end

    get do
      GTFS::Agency.limit(DEFAULT_LIMIT).page(params[:page]).all
    end

    params do
      optional :page, type: Fixnum, default: 1

      group :conditions do
        optional :page, type: Fixnum, default: 1
        GTFS::Agency.attribute_set.each do |attr|
          optional attr.name, type: attr.primitive
        end
      end

      optional :conditions, type: Hash, default: {}
    end

    get :search do
      GTFS::Agency.limit(DEFAULT_LIMIT).page(params[:page]).where(params[:conditions]).all
    end

  end

  resource :calendars do

    params do
      optional :page, type: Fixnum, default: 1
    end
    get do
      GTFS::Calendar.limit(DEFAULT_LIMIT).page(params[:page]).all
    end

    params do
      optional :page, type: Fixnum, default: 1
      group :conditions do
        GTFS::Calendar.attribute_set.each do |attr|
          optional attr.name, type: attr.primitive
        end
      end
      optional :conditions, type: Hash, default: {}
    end
    get :search do
      GTFS::Calendar.limit(DEFAULT_LIMIT).page(params[:page]).where(params[:conditions]).all
    end

  end

  resource :frequencies do

    params do
      optional :page, type: Fixnum, default: 1
    end

    get do
      GTFS::Frequency.limit(DEFAULT_LIMIT).page(params[:page]).all
    end

    params do
      optional :page, type: Fixnum, default: 1
      group :conditions do
        GTFS::Frequency.attribute_set.each do |attr|
          optional attr.name, type: attr.primitive
        end
      end
      optional :conditions, type: Hash, default: {}
    end

    get :search do
      GTFS::Frequency.limit(DEFAULT_LIMIT).page(params[:page]).where(params[:conditions]).all
    end
  end

  resource :routes do

    params do
      optional :page, type: Fixnum, default: 1
    end

    get do
      GTFS::Route.limit(DEFAULT_LIMIT).page(params[:page]).all
    end

    params do
      optional :page, type: Fixnum, default: 1
      group :conditions do
        GTFS::Route.attribute_set.each do |attr|
          optional attr.name, type: attr.primitive
        end
      end
      optional :conditions, type: Hash, default: {}
    end
    get :search do
      GTFS::Route.limit(DEFAULT_LIMIT).page(params[:page]).where(params[:conditions]).all
    end

  end

  resources :shapes do

    params do
      optional :page, type: Fixnum, default: 1
    end

    get do
      GTFS::Shape.limit(DEFAULT_LIMIT).page(params[:page]).all
    end

    params do
      optional :page, type: Fixnum, default: 1
      group :conditions do
        GTFS::Shape.attribute_set.each do |attr|
          optional attr.name, type: attr.primitive
        end
      end
      optional :conditions, type: Hash, default: {}
    end
    get :search do
      GTFS::Shape.limit(DEFAULT_LIMIT).page(params[:page]).where(params[:conditions]).all
    end
  
  end

  get :stops do
    GTFS::Stop.all
  end

  get :stop_times do
    GTFS::StopTime.all
  end

  get :transfers do
    GTFS::Transfer.all
  end

  get :trips do
    GTFS::Trip.all
  end

end
