#!/usr/bin/perl

# Title:       Kernel SA SUSE-SU-2013:1022-2
# Description: Solves 14 vulnerabilities and has 38 fixes
# Modified:    2013 Oct 10
#
##############################################################################
# Copyright (C) 2013 SUSE LLC
##############################################################################
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, see <http://www.gnu.org/licenses/>.
#
#  Authors/Contributors:
#   Jason Record (jrecord@suse.com)
#
##############################################################################

##############################################################################
# Module Definition
##############################################################################

use strict;
use warnings;
use SDP::Core;
use SDP::SUSE;

##############################################################################
# Overriden (eventually or in part) from SDP::Core Module
##############################################################################

@PATTERN_RESULTS = (
	PROPERTY_NAME_CLASS."=Security",
	PROPERTY_NAME_CATEGORY."=SLE",
	PROPERTY_NAME_COMPONENT."=Kernel",
	PROPERTY_NAME_PATTERN_ID."=$PATTERN_ID",
	PROPERTY_NAME_PRIMARY_LINK."=META_LINK_Security",
	PROPERTY_NAME_OVERALL."=$GSTATUS",
	PROPERTY_NAME_OVERALL_INFO."=None",
	"META_LINK_Security=http://lists.opensuse.org/opensuse-security-announce/2013-05/msg00017.html"
);

##############################################################################
# Main Program Execution
##############################################################################

SDP::Core::processOptions();
my $NAME = 'Kernel';
my $MAIN_PACKAGE = '';
my $SEVERITY = 'Important';
my $TAG = 'SUSE-SU-2013:1022-2';
my %PACKAGES = ();
if ( SDP::SUSE::compareKernel(SLE11SP2) >= 0 && SDP::SUSE::compareKernel(SLE11SP3) < 0 ) {
	%PACKAGES = (
		'cluster-network-kmp-default' => '1.4_3.0.80_0.5-2.18.45',
		'cluster-network-kmp-pae' => '1.4_3.0.80_0.5-2.18.45',
		'cluster-network-kmp-ppc64' => '1.4_3.0.80_0.5-2.18.45',
		'cluster-network-kmp-trace' => '1.4_3.0.80_0.5-2.18.45',
		'cluster-network-kmp-xen' => '1.4_3.0.80_0.5-2.18.45',
		'gfs2-kmp-default-2_3.0.80_0.5' => '0.7.76',
		'gfs2-kmp-pae-2_3.0.80_0.5' => '0.7.76',
		'gfs2-kmp-ppc64-2_3.0.80_0.5' => '0.7.76',
		'gfs2-kmp-trace-2_3.0.80_0.5' => '0.7.76',
		'gfs2-kmp-xen-2_3.0.80_0.5' => '0.7.76',
		'kernel-default' => '3.0.80-0.5.1',
		'kernel-default-base' => '3.0.80-0.5.1',
		'kernel-default-devel' => '3.0.80-0.5.1',
		'kernel-default-extra' => '3.0.80-0.5.1',
		'kernel-default-man' => '3.0.80-0.5.1',
		'kernel-ec2' => '3.0.80-0.5.1',
		'kernel-ec2-base' => '3.0.80-0.5.1',
		'kernel-ec2-devel' => '3.0.80-0.5.1',
		'kernel-pae' => '3.0.80-0.5.1',
		'kernel-pae-base' => '3.0.80-0.5.1',
		'kernel-pae-devel' => '3.0.80-0.5.1',
		'kernel-pae-extra' => '3.0.80-0.5.1',
		'kernel-ppc64' => '3.0.80-0.5.1',
		'kernel-ppc64-base' => '3.0.80-0.5.1',
		'kernel-ppc64-devel' => '3.0.80-0.5.1',
		'kernel-source' => '3.0.80-0.5.1',
		'kernel-syms' => '3.0.80-0.5.1',
		'kernel-trace' => '3.0.80-0.5.1',
		'kernel-trace-base' => '3.0.80-0.5.1',
		'kernel-trace-devel' => '3.0.80-0.5.1',
		'kernel-trace-extra' => '3.0.80-0.5.1',
		'kernel-xen' => '3.0.80-0.5.1',
		'kernel-xen-base' => '3.0.80-0.5.1',
		'kernel-xen-devel' => '3.0.80-0.5.1',
		'kernel-xen-extra' => '3.0.80-0.5.1',
		'ocfs2-kmp-default' => '1.6_3.0.80_0.5-0.11.44',
		'ocfs2-kmp-pae' => '1.6_3.0.80_0.5-0.11.44',
		'ocfs2-kmp-ppc64' => '1.6_3.0.80_0.5-0.11.44',
		'ocfs2-kmp-trace' => '1.6_3.0.80_0.5-0.11.44',
		'ocfs2-kmp-xen' => '1.6_3.0.80_0.5-0.11.44',
		'xen-kmp-default' => '4.1.5_02_3.0.80_0.5-0.5.5',
		'xen-kmp-trace' => '4.1.5_02_3.0.80_0.5-0.5.5',
	);
	SDP::SUSE::securityAnnouncementPackageCheck($NAME, $MAIN_PACKAGE, $SEVERITY, $TAG, \%PACKAGES);
} else {
	SDP::Core::updateStatus(STATUS_ERROR, "ERROR: $NAME Security Announcement: Outside the kernel scope");
}
SDP::Core::printPatternResults();

exit;

