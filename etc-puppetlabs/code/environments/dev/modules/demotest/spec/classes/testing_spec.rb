# frozen_string_literal: true

require 'spec_helper'

describe 'demotest::testing' do
      it { is_expected.to compile }
      it { is_expected.to contain_file('/var/tmp/unittesting').with( 'ensure' => 'present') }
      it { is_expected.to contain_package('git').with( 'ensure' => 'installed') }
end
