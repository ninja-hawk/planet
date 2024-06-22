

for asset <- [
  %{
    name: "Civil Engeneering",
    description: "Expertise on civil engineering. Civil engineers will Know-how to build a city that increases the accessibility to your social welfare programmes.",
    is_skill: true,
    eco_effect: 0,
    is_duplicatable: false,
    deleted_at: nil
  },
  %{
    name: "Economist",
    description: "Economists suggests policies on variety of topic",
    is_skill: false,
    eco_effect: 0,
    is_duplicatable: false,
    deleted_at: nil
  },
  %{
    name: "Educated Labour Force",
    description: "These young  population can work with higher productivity and supports your economy from the bottom.",
    is_skill: false,
    eco_effect: 0,
    is_duplicatable: false,
    deleted_at: nil
  },
  %{
    name: "Engenner",
    description: "These young men/women are the source of innovation. Hence, having them can allow your nation to access technologies and knowledge you did not have, such as civil engeering for your power grid",
    is_skill: false,
    eco_effect: 0,
    is_duplicatable: false,
    deleted_at: nil
  },
  %{
    name: "Knowledge on Power Plant",
    description: "Experties on harvesting electricity and, building a basic power grid and a plantation.",
    is_skill: true,
    eco_effect: 0,
    is_duplicatable: false,
    deleted_at: nil
  },
  %{
    name: "Know-how of education",
    description: "Experties on education system. Education allows you to become educator",
    is_skill: true,
    eco_effect: 0,
    is_duplicatable: false,
    deleted_at: nil
  },
  %{
    name: "Knowledge of healthcare",
    description: "Experties on health care system. Affodable health care allows your population to be haelthier life and work in full potential.",
    is_skill: true,
    eco_effect: 0,
    is_duplicatable: false,
    deleted_at: nil
  },
  %{
    name: "Nuclear Fusion Tech",
    description: "New efficient way to creat electricity. Doesn't produce any CO2 and yet creates more electricity",
    is_skill: true,
    eco_effect: 0,
    is_duplicatable: false,
    deleted_at: nil
  },
  %{
    name: "Robotics Tech",
    description: "Technological advancement allows your nation to have high-effiency economy.",
    is_skill: true,
    eco_effect: 0,
    is_duplicatable: false,
    deleted_at: nil
  },
  %{
    name: "Water Cleaning system",
    description: "Experties on fresh water supply system. Access to fresh water is essecial for raising standard of living and to have more economic growth.",
    is_skill: true,
    eco_effect: 0,
    is_duplicatable: false,
    deleted_at: nil
  },
  %{
    name: "Youthful Population",
    description: "Youthful population is the driving force of the economy. At the correct condition, they can work as a great labour force, a source of innovation.",
    is_skill: false,
    eco_effect: 0,
    is_duplicatable: false,
    deleted_at: nil
  }
] do
  {:ok, _} = Planet.Cosmos.create_asset(asset)
end
