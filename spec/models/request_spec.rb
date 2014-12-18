require 'rails_helper'

RSpec.describe Request, :type => :model do
  describe "validations" do
    context "floor" do
      it "can't be a number" do
        request_instance = Request.new(floor: 2)
        expect(request_instance.valid?).to be(false)
      end

      it "must be in the inclusion list" do
        request_instance = Request.new(floor: "d")
        request_instance.valid?

        expect(request_instance.errors.messages[:floor]).to eq(["is not included in the list"])
      end

      it "can be 'b'" do
        request_instance = Request.new(floor: "b")
        expect(request_instance.valid?).to be(true)
      end

      it "must be present" do
        request_instance = Request.new()
        expect(request_instance.valid?).to be(false)
      end

      it "must be less than 6" do
        request_instance = Request.new(floor: "6")
        expect(request_instance.valid?).to be(false)
      end

      it "must be greater than 0" do
        request_instance = Request.new(floor: 0)
        expect(request_instance.valid?).to be(false)
      end
    end
  end

  describe '#active' do
    let(:ar1) { Request.create floor: "1" }
    let(:ar2) { Request.create floor: "1" }
    let(:dr1) { Request.create floor: "1", deleted: true }

    it 'does not show deleted requests' do
      expect(Request.active).to_not include(dr1)
    end

    it 'shows active requests' do
      expect(Request.active).to include(ar1)
    end
  end
end
