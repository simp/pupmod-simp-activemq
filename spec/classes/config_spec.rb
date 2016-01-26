require 'spec_helper'

describe 'activemq::config' do

  base_facts = {
    :osfamily => 'RedHat'
  }
  let(:facts){base_facts}

  let(:params){{ 'server_config' => 'template("simp/activemq.xml.erb")',
                 'manage_config' => true,
                 'instance'      => 'mcollective',
                 'package'       => 'activemq',
                 'path'          => '/etc/activemq/activemq.xml' }}


  it { is_expected.to create_class('activemq::config') }
  it { is_expected.to create_file('/usr/share/activemq/conf/activemq-wrapper.conf') }
  it { is_expected.to contain_file('activemq.xml').with({
         'path'    => '/etc/activemq/activemq.xml',
         'content' => 'template("simp/activemq.xml.erb")'}) }

end
