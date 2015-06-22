require 'rails_helper'

describe Event, type: :model do

  let(:event){ build(:event) }

  describe 'associations' do
    it { is_expected.to belong_to :place }
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :price }
    it { is_expected.to belong_to :subcategory }
    it { is_expected.to have_and_belong_to_many :personas }
    it { is_expected.to have_and_belong_to_many :categories }
    it { is_expected.to have_and_belong_to_many :weeks }
    it { is_expected.to have_many :agendas }
    it { is_expected.to have_many :agended_by }
    it { is_expected.to have_many :tips }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :date_start }
  end

  describe '#create' do

    context 'event valid' do
      it 'should create event' do
        event = create(:event)

        event.save

        expect(event).to be_valid
      end
    end

    context 'event invalid' do
      it 'should NOT create event' do
        event = Event.new

        event.save

        expect(event).to_not be_valid
      end
    end

  end

  describe '.geocoded_by_address' do
    context 'when address is complete' do
      it('should geocoded country') { expect(event.country_code).to eq('US') }
      it('should geocoded state') { expect(event.state_name).to eq('New York') }
      it('should geocoded city') { expect(event.city_name).to eq('Albany') }
      it('should geocoded latitude') { expect(event.latitude).to be_a_kind_of(Float) }
      it('should geocoded longitude') { expect(event.longitude).to be_a_kind_of(Float) }
    end
  end

  describe '#country' do
    it 'should return country of event' do
      create(:country, name: 'United States')
      create(:country, name: 'Brazil')

      expect(event.country.name).to eq('United States')
    end
  end

  describe '#state' do
    it 'should return state of event' do
      create(:state, name: 'New York')
      create(:state, name: 'Florida')

      expect(event.state.name).to eq('New York')
    end
  end

  describe '#city' do
    it 'should return city of event' do
      create(:city, name: 'Albany')
      create(:city, name: 'Rio de Janeiro')

      expect(event.city.name).to eq('Albany')
    end
  end

  describe '#neighborhood' do
    it 'should return neighborhood of event' do
      create(:neighborhood, name: 'Pine Hills')
      create(:neighborhood, name: 'Bronx')

      expect(event.neighborhood.name).to eq('Pine Hills')
    end
  end

  describe '#place' do
    it 'should return a place from event' do
      create(:place, name: 'New York State Museum')
      create(:place, name: 'Cristo Redentor')

      expect(event.place.name).to eq('New York State Museum')
    end
  end

  describe '#name_with_limit' do
    it 'should return name of event with limit of chars' do
      event = create(:event, name: 'This name of events have more than 45 chars for make this test testable')

      expect(event.name_with_limit.length).to eq(49)
    end
  end

  describe '#description_whit_limit' do
    it 'should return description of event with limit of chars' do
      event = create(:event, description: 'This description of events have more than 70 chars for make this test testable testable')

      expect(event.description_with_limit.length).to eq(90)
    end
  end

  describe '#relative_latitude' do
    it 'should return the latitude from event' do
      expect(event.relative_latitude.to_s).to start_with('42.663')
    end
  end

  describe '#relative_longitude' do
    it 'should return the longitude from event' do
      expect(event.relative_longitude.to_s).to start_with('-73.774')
    end
  end

  describe '#price' do
    context 'when event have a price' do
      it 'should return price of event' do
        expect(event.price).to eq('$1,200.00')
      end
    end
    context 'when event DO NOT have a price' do
      it 'should return a string' do
        event = create(:event, cost: 0)

        expect(event.price).to eq('Free')
      end
    end
  end

  describe '#period_that_occurs' do
    it 'should return a period that event occurs' do

      expect(event.period_that_occurs).to eq('17/11 - 28/11')
    end
  end


end