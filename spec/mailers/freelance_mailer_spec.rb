require "rails_helper"

RSpec.describe FreelanceMailer, type: :mailer do
  describe "project_approval" do
    let(:mail) { FreelanceMailer.project_approval }

    it "renders the headers" do
      expect(mail.subject).to eq("Project approval")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "signup_confirmation" do
    let(:mail) { FreelanceMailer.signup_confirmation }

    it "renders the headers" do
      expect(mail.subject).to eq("Signup confirmation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
