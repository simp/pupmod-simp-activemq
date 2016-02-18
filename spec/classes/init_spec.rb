require 'spec_helper'

describe 'activemq' do
  context 'supported operating system' do
    on_supported_os.each do |os, facts|
      let(:facts) do
        facts
      end

      context "on #{os}" do
        let(:params){{ 'mq_admin_password' => 'foobarbaz', 'mq_cluster_password' => 'p@55123' }}
        it { is_expected.to create_class('activemq') }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('activemq::packages') }
        it { is_expected.to create_class('activemq::config') }
        it { is_expected.to create_class('activemq::service') }
      end
    end
  end
end
