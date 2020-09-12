require './hotel'
RSpec.describe  Hotel do
    describe "#check_in_guest" do
        it 'can check guest in' do
            subject.check_in_guest('Simon', 300)
            expect(subject.guests).to include 'Simon'
        end

        context 'room is available' do
            it 'allows to check-in' do
                expect(subject.check_in_guest('Simon', 300)).to be true
            end
        end

        context 'room is not available' do
            it 'disallows check-in' do
                subject.check_in_guest('Paul', 300)
                expect(subject.check_in_guest('Simon', 300)).to be false
            end

            it 'does not add guest to the hotel guest list' do
                subject.check_in_guest('Paul', 300)
                subject.check_in_guest('Simon', 300)
                expect(subject.guests).not_to include 'Simon'
            end
        end
    end

    describe "#check_out_guest" do
        it 'removes guest from hotel guest list' do
            subject.check_in_guest('Peter', 102)
            subject.check_out_guest('Peter', 102)
            expect(subject.guests).not_to include 'Peter'
        end

        it 'frees up the room' do
            subject.check_in_guest('Paul', 300)
            subject.check_out_guest('Paul', 300)
            expect(subject.check_in_guest('simon', 300)).to be true
        end
    end
end