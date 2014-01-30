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

class API < Grape::API

  before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
  end

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

  resources :stops do

    params do
      optional :page, type: Fixnum, default: 1
    end
    get do
      GTFS::Stop.limit(DEFAULT_LIMIT).page(params[:page]).all
    end

    params do
      optional :page, type: Fixnum, default: 1
      group :conditions do
        GTFS::Stop.attribute_set.each do |attr|
          optional attr.name, type: attr.primitive
        end
      end
      optional :conditions, type: Hash, default: {}
    end
    get :search do
      GTFS::Stop.limit(DEFAULT_LIMIT).page(params[:page]).where(params[:conditions]).all
    end

  end

  resources :stop_times do

    params do
      optional :page, type: Fixnum, default: 1
    end
    get do
      GTFS::StopTime.limit(DEFAULT_LIMIT).page(params[:page]).all
    end

    params do
      optional :page, type: Fixnum, default: 1
      group :conditions do
        GTFS::StopTime.attribute_set.each do |attr|
          optional attr.name, type: attr.primitive
        end
      end
      optional :conditions, type: Hash, default: {}
    end
    get :search do
      GTFS::StopTime.limit(DEFAULT_LIMIT).page(params[:page]).where(params[:conditions]).all
    end

  end

  resources :trips do
    params do
      optional :page, type: Fixnum, default: 1
    end
    get do
      GTFS::Trip.limit(DEFAULT_LIMIT).page(params[:page]).all
    end

    params do
      optional :page, type: Fixnum, default: 1
      group :conditions do
        GTFS::Trip.attribute_set.each do |attr|
          optional attr.name, type: attr.primitive
        end
      end
      optional :conditions, type: Hash, default: {}
    end
    get :search do
      GTFS::Trip.limit(DEFAULT_LIMIT).page(params[:page]).where(params[:conditions]).all
    end
  end

  resources :transfers do
    params do
      optional :page, type: Fixnum, default: 1
    end
    get do
      GTFS::Transfer.limit(DEFAULT_LIMIT).page(params[:page]).all
    end

    params do
      optional :page, type: Fixnum, default: 1
      group :conditions do
        GTFS::Transfer.attribute_set.each do |attr|
          optional attr.name, type: attr.primitive
        end
      end
      optional :conditions, type: Hash, default: {}
    end
    get :search do
      GTFS::Transfer.limit(DEFAULT_LIMIT).page(params[:page]).where(params[:conditions]).all
    end
  end

end
