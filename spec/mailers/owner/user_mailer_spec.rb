require "rails_helper"

RSpec.describe Owner::UserMailer, type: :mailer do
  describe "account_activation" do
    let(:mail) { Owner::UserMailer.account_activation }

    it "renders the headers" do
      expect(mail.subject).to eq("Account activation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "passwod_reset" do
    let(:mail) { Owner::UserMailer.passwod_reset }

    it "renders the headers" do
      expect(mail.subject).to eq("Passwod reset")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
