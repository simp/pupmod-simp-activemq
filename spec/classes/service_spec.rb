require 'spec_helper'

describe 'activemq::service' do
  context 'supported operating system' do
    on_supported_os.each do |os, facts|
      let(:facts) do
        facts
      end

      context "on #{os}" do
        let(:params){{ :ensure => 'running', :service_enable => true}}

        it { is_expected.to create_class('activemq::service') }
        it { is_expected.to contain_service('activemq') }
      end
    end
  end
end
