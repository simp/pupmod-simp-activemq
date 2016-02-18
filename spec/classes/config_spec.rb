require 'spec_helper'

describe 'activemq::config' do

  context 'supported operating system' do
    on_supported_os.each do |os, facts|
      let(:facts) do
        facts
      end

      context "on #{os}" do
        let(:params){{ 'server_config' => 'template("simp/activemq.xml.erb")',
                       'instance'      => 'mcollective',
                       'package'       => 'activemq',
                       'path'          => '/etc/activemq/activemq.xml' }}

        it { is_expected.to create_class('activemq::config') }
        it { is_expected.to contain_file('activemq.xml').with({
               'path'    => '/etc/activemq/activemq.xml',
               'content' => 'template("simp/activemq.xml.erb")'}) }
      end
    end
  end
end
