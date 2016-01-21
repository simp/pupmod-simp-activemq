require 'spec_helper'

describe 'activemq::packages' do
  base_facts = {
    :osfamily => 'RedHat'
  }
  let(:facts){base_facts}

  let(:params){{ :version => 'present', :package => 'activemq'}}

  it { should create_class('activemq::packages') }
  it { should contain_package('activemq') }
  it { should contain_file('/etc/init.d/activemq') }
end
