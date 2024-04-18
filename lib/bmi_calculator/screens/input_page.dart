import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:state_mangment_provider/bmi_calculator/provider/gender_provider.dart';
import 'package:state_mangment_provider/bmi_calculator/screens/results_page.dart';
import 'package:state_mangment_provider/provider/theme_provider.dart';

import '../calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/drawer_widget.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';
import '../provider/height_provider.dart';
import '../provider/weight_age_provider.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    print("Build");
    final themeChanger = Provider.of<ThemeProvider>(context);
    final heightProvider = Provider.of<HeightProvider>(context, listen: false);
    final weightAgeProvider =
        Provider.of<WeightAgeProvider>(context, listen: false);
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey here
      drawer: DrawerWidget(themeChanger: themeChanger),
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu,
              color: Theme.of(context).iconTheme.color), // Set the color here
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Consumer<GenderProvider>(
            builder: (context, value, child) {
              return Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {

                        value.changeGender(Gender.male);
                      },
                      colour: value.selectedGender == Gender.male
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.secondary,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {

                        value.changeGender(Gender.female);
                      },
                      colour: value.selectedGender == Gender.female
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.secondary,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ));
            },
          ),
          Expanded(
            child: ReusableCard(
              colour: Theme.of(context).primaryColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Consumer<HeightProvider>(
                          builder: (context, value, child) {
                        return Text(
                          value.height.toInt().toString(),
                          style: Theme.of(context).textTheme.displayMedium,
                        );
                      }),
                      Text(
                        'cm',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.purple,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Consumer<HeightProvider>(
                        builder: (context, value, child) {
                      return Slider(
                        value: value.height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {

                          value.setHeight(newValue);
                        },
                      );
                    }),
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Theme.of(context).colorScheme.secondary,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Consumer<WeightAgeProvider>(
                            builder: (context, weight, child) {
                          return Text(
                            weight.weight.toString(),
                            style: Theme.of(context).textTheme.displayMedium,
                          );
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {


                                  int weight = weightAgeProvider.weight;

                                  weightAgeProvider.setWeight(--weight);
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {

                                int weight = weightAgeProvider.weight;
                                weightAgeProvider.setWeight(++weight);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Theme.of(context).colorScheme.secondary,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',
                            style: Theme.of(context).textTheme.headlineSmall),
                        Consumer<WeightAgeProvider>(builder: (_, value, child) {
                          return Text(
                           value.age.toString(),
                            style: Theme.of(context).textTheme.displayMedium,
                          );
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                int age= weightAgeProvider.age;
                               weightAgeProvider.setAge(--age);
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  int age= weightAgeProvider.age;
                                  weightAgeProvider.setAge(++age);
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {

              CalculatorBrain calc = CalculatorBrain(
                  height: heightProvider.height.toInt(), weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
