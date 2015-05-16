require 'spec_helper'

describe 'activemq' do

  let(:params){{ 'mq_admin_password' => 'foobarbaz', 'mq_cluster_password' => 'p@55123' }}
  it { should create_class('activemq') }

  it { should compile.with_all_deps }
  it { should create_class('activemq::packages') }
  it { should create_class('activemq::config') }
  it { should create_class('activemq::service') }
end
