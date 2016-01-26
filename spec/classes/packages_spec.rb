require 'spec_helper'

describe 'activemq::packages' do
  base_facts = {
    :osfamily => 'RedHat'
  }
  let(:facts){base_facts}

  let(:params){{ :version => 'present', :package => 'activemq'}}

  it { is_expected.to create_class('activemq::packages') }
  it { is_expected.to contain_package('activemq') }
  it { is_expected.to contain_package('tanukiwrapper') }
  it { is_expected.to contain_file('/etc/init.d/activemq') }
end
