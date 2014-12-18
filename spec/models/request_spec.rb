require 'rails_helper'

RSpec.describe Request, :type => :model do
  describe "validations" do
    context "floor" do
      it "is an integer" do
        request_instance = Request.new(floor: 2)
        expect(request_instance.valid?).to be(true)
      end

      it "can't be a non-number" do
        request_instance = Request.new(floor: "d")
        expect(request_instance.valid?).to be(false)
      end

      it "must be present" do
        request_instance = Request.new()
        expect(request_instance.valid?).to be(false)
      end

      it "can't be a float" do
        request_instance = Request.new(floor: 2.3)
        expect(request_instance.valid?).to be(false)
      end

      it "must be less than 6" do
        request_instance = Request.new(floor: 6)
        request_instance.valid?

        expect(request_instance.errors.messages[:floor]).to eq(["must be less than 6"])
      end

      it "must be greater than 0" do
        request_instance = Request.new(floor: 0)
        request_instance.valid?

        expect(request_instance.errors.messages[:floor]).to eq(["must be greater than 0"])
      end
    end
  end

  describe '#active' do
    let(:ar1) { Request.create floor: 1 }
    let(:ar2) { Request.create floor: 1 }
    let(:dr1) { Request.create floor: 1, deleted: true }

    it 'does not show deleted requests' do
      expect(Request.active).to_not include(dr1)
    end

    it 'shows active requests' do
      expect(Request.active).to include(ar1)
    end
  end
end
