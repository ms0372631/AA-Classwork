import {connect} from 'react-redux';
import { selectAllPokemon } from '../../reducers/selectors';
import { requestAllPokemon } from '../../actions/pokemon_actions';
import PokemonIndex from './pokemon_index';

const mapStateToProps = state => {
  return {
    pokemon: selectAllPokemon(state),
    state
  };
};

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: pokemon => dispatch(requestAllPokemon(pokemon))
});

const PokemonIndexContainer =  connect(mapStateToProps,mapDispatchToProps)(PokemonIndex);
export default PokemonIndexContainer;