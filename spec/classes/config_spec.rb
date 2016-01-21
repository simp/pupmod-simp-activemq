require 'spec_helper'

describe 'activemq::config' do

  base_facts = {
    :osfamily => 'RedHat'
  }
  let(:facts){base_facts}

  let(:params){{ 'server_config' => 'template("simp/activemq.xml.erb")',
                 'instance'      => 'mcollective',
                 'package'       => 'activemq',
                 'path'          => '/etc/activemq/activemq.xml' }}


  it { should create_class('activemq::config') }
  it { should contain_file('activemq.xml').with({
         'path'    => '/etc/activemq/activemq.xml',
         'content' => 'template("simp/activemq.xml.erb")'}) }

end
