require 'spec_helper'

describe 'activemq::packages' do
  context 'supported operating system' do
    on_supported_os.each do |os, facts|
      let(:facts) do
        facts
      end

      context "on #{os}" do
        let(:params){{ :version => 'present', :package => 'activemq'}}
        it { is_expected.to create_class('activemq::packages') }
        it { is_expected.to contain_package('activemq') }
        it { is_expected.to contain_file('/etc/init.d/activemq') }
      end
    end
  end
end
