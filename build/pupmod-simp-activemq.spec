%global short_name activemq

Summary:  SIMP ActiveMQ Puppet Module
Name: pupmod-simp-activemq
Version: 3.0.0
Release: 0
License: Apache License, Version 2.0
Group: Applications/System
Source: %{name}-%{version}-%{release}.tar.gz
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-buildroot
Buildarch: noarch
Requires: pupmod-iptables => 4.1.0-3
Requires: pupmod-puppetlabs-java => 1.2.0-0
Requires: puppetlabs-java_ks >= 1.4.0
Requires: puppet >= 3.4

Prefix:"/etc/puppet/environments/simp/modules/%{short_name}"

%description
A module to configure activemq to comply with security standards within SIMP.

%prep
%setup -q

%build

%install

[ "%{buildroot}" != "/" ] && rm -rf %{buildroot}

mkdir -p %{buildroot}/%{prefix}

dirs='manifests templates'
for dir in $dirs; do
  test -d $dir && cp -r $dir %{buildroot}/%{prefix}
done

%clean
[ "%{buildroot}" != "/" ] && rm -rf %{buildroot}

%files
%defattr(0640,root,puppet,0750)
/etc/puppet/environments/simp/modules/%{short_name}

%post
# Post installation stuff

%postun
# Post uninstall stuff

%changelog
* Thu Jan 21 2016 Nick Markowski <nmarkowski@keywcorp.com> - 3.0.0-0
- Updated module to the latest for enhanced features and deprecation
  of the tanukiwrapper dependency.

* Mon Nov 09 2015 Chris Tessmer <chris.tessmer@onypoint.com> - 2.0.0-1
- migration to simplib and simpcat (lib/ only)

* Fri Jan 16 2015 Trevor Vaughan <tvaughan@onyxpoint.com> - 2.0.0-0
- Changed puppet-server requirement to puppet

* Wed Jan 14 2015 Nick Markowski <nmarkowski@keywcorp.com> - 2.0.0-0
- Rebased the module off of puppetlabs-activemq-0.4.0

* Wed May 21 2014 Nick Markowski <nmarkowski@keywcorp.com> - 1.0.1-alpha
- You can now pass 'instance' and 'server_config' to the simp activemq, and
  reasonable defaults were set.

* Mon Apr 14 2014 Kendall Moore <kmoore@keywcorp.com> - 1.0.1-alpha
- Refactored simp.pp to pass lint tests for puppet 3 and hiera compatibility.

* Wed Oct 23 2013 Nick Markowski <nmarkowski@keywcorp.com> - 1.0.0-alpha
- Initial build
