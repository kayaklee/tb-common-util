Summary: Taobao csrd middleware of TCP/IP communication
Name: t-csrd-tbnet-devel
Version: %{_version}
Release: %(echo $RELEASE)%{?dist}
Group: Taobao
URL: http:://yum.corp.alimama.com
Packager: Ye Feng<yefeng@taobao.com>
License: Taobao
Prefix:%{_prefix}

%description
%{_svn_path}
%{_svn_revision}

%define __arch_install_post %{nil}

%description
This package provides the headers and shared objects of tbnet.

%build
cd ../../..
chmod u+x build.sh tbnet/autogen.sh tbsys/autogen.sh
export TBLIB_ROOT=$RPM_BUILD_ROOT/%{_prefix}
./build.sh make 

%install
cd ../../..
export TBLIB_ROOT=$RPM_BUILD_ROOT/%{_prefix}
./build.sh install
./build.sh clean

%clean
rm -rf $RPM_BUILD_ROOT

%post
echo %{_prefix}/lib > /etc/ld.so.conf.d/tbnet.conf
/sbin/ldconfig

%postun
rm  -f /etc/ld.so.conf.d/tbnet.conf

%files
%defattr(0755, root, root)
%{_prefix}/include
%{_prefix}/lib

%changelog
* Tue Nov 10 2009 yefeng <yefeng@taobao.com> 
- Rebuild for  Red Hat Enterprise Linux AS release 5.3(Tikanga)
- SVN Tag: http://svn.taobao-develop.com/repos/ttsc/trunk/common

