# This file is part of KalibroGatekeeperClient
# Copyright (C) 2013  it's respectives authors (please see the AUTHORS file)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FactoryGirl.define do
  factory :metric_configuration, class: KalibroClient::Entities::Configurations::MetricConfiguration do
    metric { FactoryGirl.build(:metric) }
    weight 1
    aggregation_form "mean"
    reading_group_id 1
    kalibro_configuration_id 1

    trait :with_id do
      id 1
    end

    trait :compound_metric do
      metric { FactoryGirl.build(:compound_metric) }
    end

    trait :sum_metric_configuration do
      aggregation_form :SUM
    end

    trait :maximum_metric_configuration do
      aggregation_form :MAX
    end

    trait :minimum_metric_configuration do
      aggregation_form :MIN
    end

    trait :flog do
      metric { FactoryGirl.build(:flog_metric) }
    end

    trait :saikuro do
      metric { FactoryGirl.build(:saikuro_metric) }
    end

    trait :flog_compound_metric_configuration do
      metric { FactoryGirl.build(:kalibro_gatekeeper_client_compound_flog_metric) }
      weight 1
      aggregation_form :AVERAGE
      reading_group_id 1
      kalibro_configuration_id 1
    end

    trait :saikuro_compound_metric_configuration do
      metric { FactoryGirl.build(:compound_saikuro_metric) }
      weight 0.1
      aggregation_form :AVERAGE
      reading_group_id 1
      kalibro_configuration_id 1
    end

    factory :compound_metric_configuration, traits: [:compound_metric]
    factory :flog_metric_configuration, traits: [:flog]
    factory :flog_compound_metric_configuration, traits: [:flog_compound_metric_configuration]
    factory :saikuro_metric_configuration, traits: [:saikuro]
    factory :saikuro_compound_metric_configuration, traits: [:saikuro_compound_metric_configuration]
    factory :sum_metric_configuration, traits: [:sum_metric_configuration]
    factory :maximum_metric_configuration, traits: [:maximum_metric_configuration]
    factory :minimum_metric_configuration, traits: [:minimum_metric_configuration]
  end

  factory :another_metric_configuration, class: KalibroClient::Entities::Configurations::MetricConfiguration do
    id 2
    metric { FactoryGirl.build(:metric) }
    weight 1
    aggregation_form "COUNT"
    reading_group_id 2
    kalibro_configuration_id 2
  end
end
