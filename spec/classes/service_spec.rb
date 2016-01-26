require 'spec_helper'

describe 'activemq::service' do
  let(:params){{ :ensure => 'running'}}

  it { is_expected.to create_class('activemq::service') }
  it { is_expected.to contain_service('activemq') }
end
