require 'spec_helper'

describe 'activemq::service' do
  let(:params){{ :ensure => 'running'}}

  it { should create_class('activemq::service') }
  it { should contain_service('activemq') }
end
