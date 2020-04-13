# @summary Add agent annotation
#
# @example
#   sensu::agent::annotation { 'fatigue_check/occurrences:': value => '2' }
#
# @param key
#   Key of the annotation to add to agent.yml, defaults to `$name`.
# @param value
#   Label value to add to agent.yml
# @param order
#   Order of the datacat fragment
#
define sensu::agent::annotation (
  String[1] $value,
  String[1] $key   = $name,
  String[1] $order = '50',
) {
  datacat_fragment { "sensu_agent_config-annotation-${name}":
    target => 'sensu_agent_config',
    data   => {
      'annotations' => { $key => $value },
    },
    order  => $order,
  }
}