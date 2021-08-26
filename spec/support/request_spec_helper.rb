
module RequestSpecHelper

  include Warden::Test::Helpers #deviceのログイン認証ではDevise::TestHelpersが使えないため、Wardenを使用

  def self.included(base)
    base.before(:each) { Warden.test_mode! }
    base.after(:each) { Warden.test_reset! }
  end

  def sign_in(resource)
    login_as(resource, scope: warden_scope(resource))
  end

  def sign_out(resource)
    logout(warden_scope(resource))
  end

  private

  def warden_scope(resource)
    resource.class.name.underscore.to_sym # クラス名を小文字にし、to_symでシンボルに変換  String => :string
  end

end
