require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'account_activation' do
    let(:active_user) { create(:active_user) }
    let(:mail) { UserMailer.account_activation active_user }

    it 'renders the headers' do
      expect(mail.subject).to eq('【takemon】アカウントを有効化しましょう')
      expect(mail.to).to eq([active_user.email])
      expect(mail.from).to eq(['noreply@takemon.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(active_user.name)
      expect(mail.body.encoded).to match(active_user.activation_token)
      expect(mail.body.encoded).to match(CGI.escape(active_user.email))
    end
  end

  describe 'reset_password' do
    let(:active_user) { create(:active_user) }
    let(:mail) { UserMailer.password_reset active_user }

    it 'renders the headers' do
      expect(mail.subject).to eq('【takemon】パスワードをリセットします')
      expect(mail.to).to eq([active_user.email])
      expect(mail.from).to eq(['noreply@takemon.com'])
    end

    it 'renders the body' do
      active_user.create_reset_digest
      expect(mail.body.encoded).to match(active_user.name)
      expect(mail.body.encoded).to match(active_user.reset_token)
      expect(mail.body.encoded).to match(CGI.escape(active_user.email))
    end
  end
end
